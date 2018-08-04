# frozen_string_literal: true

class Participant < ApplicationRecord
  before_create :check_if_already_participating

  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips, dependent: :destroy

  scope :leaderboard, lambda {
    all.sort_by do |participant|
      if Nation::WINNER.present?
        [participant.earned_points,
         participant.nation == Nation::WINNER ? 1 : 0]
      else
        participant.earned_points
      end
    end.reverse
  }

  def earned_points
    tips.sum(&:earned_points)
  end

  def position
    game.participants.leaderboard.each_with_index do |participant, index|
      next if participant.earned_points > earned_points

      return index + 1 unless Nation::WINNER.present?
      return index + 1 if Nation::WINNER == nation ||
                          Nation::WINNER != participant.nation
    end
    1
  end

  def days_left_before_next_required_tip
    Match.future.includes(:tips)
         .where(days_left_before_next_required_tip_query, id).order(:begins_at)
         .first&.begins_at.try(:-, Time.now).try(:/, 1.day)&.round ||
      Float::INFINITY
  end

  def days_left_before_next_required_tip_query
    'id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id '\
    '= ?)'
  end

  private

  def check_if_already_participating
    return unless game.participants.where(user_id: user.id).any?

    throw(:abort)
  end
end
