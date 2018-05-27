class Match < ApplicationRecord
  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips

  validates :begins_at, presence: true

  scope :past, -> { where('begins_at < ?', (Rails.env.production? ? Time.now.strftime('%Y-%m-%d %H:%M:%S') : Time.now.strftime('%Y-%d-%m %H:%M:%S'))) }
  scope :future, -> { where('begins_at >= ?', (Rails.env.production? ? Time.now.strftime('%Y-%m-%d %H:%M:%S') : Time.now.strftime('%Y-%d-%m %H:%M:%S'))) }

  def goals_available?
    self.home_goals && self.away_goals
  end

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end

  def count_tips_by_others user
    self.tips.includes(:participant).find_by(participants: { user_id: user.id }) ? self.tips.count - 1 : self.tips.count
  end
end
