class Tip < ApplicationRecord
  before_save :check_if_match_started
  before_create :check_if_already_tipped

  belongs_to :participant
  belongs_to :match

  validates :home_goals, presence: true
  validates :away_goals, presence: true

  scope :unchangeable, -> { includes(:match).where('matches.begins_at < ?', (Rails.env.production? ? Time.now.strftime('%Y-%m-%d %H:%M:%S') : Time.now.strftime('%Y-%d-%m %H:%M:%S'))) }

  def goal_difference
    (self.home_goals - self.away_goals).abs
  end

  def earned_points
    return 0 unless self.match.goals_available?
    if self.correct?
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

  def correct?
    return false if self.match.penalties?
    self.home_goals == self.match.home_goals && self.away_goals == self.match.away_goals
  end

  def goal_difference?
    return false if self.match.penalties?
    self.tendency? && self.goal_difference == self.match.goal_difference
  end

  def tendency?
    if self.match.penalties?
      self.home_goals < self.away_goals && self.match.home_penalties < self.match.away_penalties || self.home_goals > self.away_goals && self.match.home_penalties > self.match.away_penalties
    else
      self.home_goals < self.away_goals && self.match.home_goals < self.match.away_goals || self.home_goals > self.away_goals && self.match.home_goals > self.match.away_goals || self.home_goals == self.away_goals && self.match.home_goals == self.match.away_goals
    end
  end

  def check_if_match_started
    throw(:abort) if self.match.begins_at.past?
  end

  def check_if_already_tipped
    throw(:abort) if self.match.tips.where(participant_id: self.participant.id).any?
  end
end
