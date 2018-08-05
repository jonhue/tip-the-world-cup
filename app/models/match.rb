# frozen_string_literal: true

class Match < ApplicationRecord
  notification_object

  belongs_to :home, class_name: 'Nation'
  belongs_to :away, class_name: 'Nation'
  has_many :tips, dependent: :destroy

  validates :begins_at, presence: true

  scope :live, -> { past.where(finished: false) }
  scope :past, lambda {
    where('begins_at < ?', Time.now.strftime('%Y-%m-%d %H:%M:%S'))
  }
  scope :future, lambda {
    where('begins_at >= ?', Time.now.strftime('%Y-%m-%d %H:%M:%S'))
  }
  scope :soon, lambda {
    future.where('begins_at < ?', Date.tomorrow.strftime('%Y-%m-%d %H:%M:%S'))
  }

  def self.next
    future.first
  end

  def live?
    home_goals && away_goals && !finished
  end

  def goals_available?
    home_goals && away_goals
  end

  def penalties?
    home_penalties && away_penalties
  end

  def goal_difference
    pure_goal_difference.abs
  end

  def pure_goal_difference
    home_goals - away_goals
  end

  def penalty_pure_goal_difference
    home_penalties - away_penalties
  end

  def count_tips_by_others(participant)
    tips.includes(:participant)
        .where(participants: { game_id: participant.game_id })
        .where.not(participants: { id: participant.id }).count
  end
end
