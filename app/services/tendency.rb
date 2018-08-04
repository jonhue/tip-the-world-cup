# frozen_string_literal: true

class Tendency
  def initialize(*goal_differences)
    @goal_differences = goal_differences
  end

  def perform
    @goal_differences.all?(&:postive?) ||
      @goal_differences.all?(&:negative?) ||
      @goal_differences.all?(&:zero?)
  end
end
