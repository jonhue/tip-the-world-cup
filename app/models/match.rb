class Match < ApplicationRecord
  notification_object

  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips, dependent: :destroy

  validates :begins_at, presence: true

  scope :past, -> { where('begins_at < ?', (Rails.env.production? ? Time.now.strftime('%Y-%m-%d %H:%M:%S') : Time.now.strftime('%Y-%d-%m %H:%M:%S'))) }
  scope :future, -> { where('begins_at >= ?', (Rails.env.production? ? Time.now.strftime('%Y-%m-%d %H:%M:%S') : Time.now.strftime('%Y-%d-%m %H:%M:%S'))) }
  scope :live, -> { past.where(finished: false) }

  def live?
    self.home_goals && self.away_goals && !self.finished
  end

  def goals_available?
    self.home_goals && self.away_goals
  end

  def penalties?
    self.home_penalties && self.away_penalties
  end

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end

  def count_tips_by_others participant
    self.tips.find_by(participant_id: participant.id) ? self.tips.includes(:participant).where(participants: { game_id: participant.game_id }).count - 1 : self.tips.includes(:participant).where(participants: { game_id: participant.game_id }).count
  end
end
