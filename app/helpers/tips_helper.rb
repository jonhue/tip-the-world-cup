# frozen_string_literal: true

module TipsHelper
  def tip_class(tip)
    if tip.earned_points == tip.game.rule_match
      5
    elsif tip.earned_points == tip.game.rule_goal_difference
      3
    elsif tip.earned_points == tip.game.rule_tendency
      2
    end
  end
end
