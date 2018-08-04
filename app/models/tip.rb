# frozen_string_literal: true

class Tip < ApplicationRecord
  before_save :check_if_match_started
  before_create :check_if_already_tipped

  belongs_to :participant
  belongs_to :match

  validates :home_goals, presence: true
  validates :away_goals, presence: true

  scope :unchangeable, lambda {
    includes(:match)
      .where('matches.begins_at < ?', Time.now.strftime('%Y-%m-%d %H:%M:%S'))
  }

  delegate :game, to: :participant, allow_nil: true

  def goal_difference
    pure_goal_difference.abs
  end

  def pure_goal_difference
    home_goals - away_goals
  end

  def earned_points
    return 0 unless match.goals_available?

    return game.rule_match if match?
    return game.rule_goal_difference if goal_difference?
    return game.rule_tendency if tendency?
    game.rule_miss
  end

  def match?
    return false if match.penalties?

    home_goals == match.home_goals && away_goals == match.away_goals
  end

  def goal_difference?
    return false if match.penalties?

    tendency? && goal_difference == match.goal_difference
  end

  def tendency?
    return tendency_penalties? if match.penalties?

    Tendency.new(pure_goal_difference, match.pure_goal_difference).perform
  end

  def tendency_penalties?
    Tendency.new(pure_goal_difference, match.penalty_pure_goal_difference)
            .perform
  end

  private

  def check_if_match_started
    return unless match.begins_at.past?

    throw(:abort)
  end

  def check_if_already_tipped
    return unless match.tips.where(participant_id: participant.id).any?

    throw(:abort)
  end
end
