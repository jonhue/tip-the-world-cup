class Participant < ApplicationRecord
  before_create :check_if_tournament_started

  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips, dependent: :destroy

  scope :leaderboard, -> { all.sort_by { |participant| WINNER ? [participant.nation == WINNER, participant.earned_points] : participant.earned_points }.reverse }

  def earned_points
    self.tips.sum(&:earned_points)
  end

  def position
    part = self
    part.class.where(game: part.game).leaderboard.each_with_index do |participant, index|
      return index + 1 if participant.earned_points == part.earned_points
    end
  end

  def days_left_before_next_required_tip
    if Match.includes(:tips).where('id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id = ?)', self.id).any?
      ((Match.includes(:tips).where('id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id = ?)', self.id).order(:begins_at).first.begins_at - DateTime.now) / 1.day).round
    else
      nil
    end
  end

  private

  def check_if_tournament_started
    return false if Match.all.order(:begins_at).first.begins_at < DateTime.now
  end
end
