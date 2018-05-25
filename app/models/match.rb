class Match < ApplicationRecord
  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips

  validates :begins_at, presence: true

  scope :past, -> { where('begins_at <= ?', Time.now.strftime('%Y-%d-%m %H:%M:%S')) }
  scope :future, -> { where('begins_at >= ?', Time.now.strftime('%Y-%d-%m %H:%M:%S')) }

  def goals_available?
    self.home_goals && self.away_goals
  end

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end
end
