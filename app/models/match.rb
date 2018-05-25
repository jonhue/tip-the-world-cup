class Match < ApplicationRecord
  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips

  def goals_available?
    self.home_goals && self.away_goals
  end

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end
end
