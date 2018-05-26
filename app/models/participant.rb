class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips

  scope :leaderboard, -> { all.sort_by { |participant| participant.earned_points }.reverse }

  def earned_points
    self.tips.sum(&:earned_points)
  end

  def position
    self.class.where(game: self.game).leaderboard.index(self) + 1
  end

  def time_left_before_next_required_tip
    ((Match.includes(:tips).where('id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id = ?)', self.id).order(:begins_at).first.begins_at - DateTime.now) / 1.day).round
  end
end
