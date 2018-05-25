class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips

  scope :leaderboard, -> { all.sort_by { |participant| participant.earned_points }.reverse }

  def earned_points
    self.tips.sum(&:earned_points)
  end
end
