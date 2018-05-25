class Tip < ApplicationRecord
  belongs_to :participant
  belongs_to :match

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end

  def earned_points
    return nil unless self.match.goals_available?
    if self.match?
      return self.participant.game.rule_match
    elsif self.goal_difference?
      return self.participant.game.rule_goal_difference
    elsif self.tendency?
      return self.participant.game.rule_tendency
    else
      return self.participant.game.rule_miss
    end
  end

  private

  def match?
    self.home_goals == self.match.home_goals && self.away_goals == self.match.away_goals
  end

  def goal_difference?
    self.tendency? && self.goal_difference == self.match.goal_difference
  end

  def tendency?
    self.home_goals < self.away_goals && self.match.home_goals < self.match.away_goals || self.home_goals > self.away_goals && self.match.home_goals > self.match.away_goals || self.home_goals == self.away_goals && self.match.home_goals == self.match.away_goals
  end
end
