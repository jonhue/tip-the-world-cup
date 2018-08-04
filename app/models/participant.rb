# frozen_string_literal: true

class Participant < ApplicationRecord
  before_create :check_if_already_participating

  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips, dependent: :destroy

  scope :leaderboard, -> { all.sort_by { |participant| Nation::WINNER ? [participant.nation == Nation::WINNER, participant.earned_points] : participant.earned_points }.reverse }

  def earned_points
    self.tips.sum(&:earned_points)
  end

  def position
    self.class.where(game: self.game).leaderboard.each_with_index do |participant, index|
      if Nation::WINNER
        if Nation::WINNER == self.nation
          return index + 1 if participant.earned_points == self.earned_points && participant.nation == self.nation
        else
          return index + 1 if participant.earned_points == self.earned_points && participant.nation != self.nation
        end
      else
        return index + 1 if participant.earned_points == self.earned_points
      end
    end
    return self.class.where(game: self.game).leaderboard.index(self) + 1
  end

  def days_left_before_next_required_tip
    if Match.future.includes(:tips).where('id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id = ?)', self.id).any?
      ((Match.future.includes(:tips).where('id NOT IN (SELECT DISTINCT(match_id) FROM tips WHERE tips.participant_id = ?)', self.id).order(:begins_at).first.begins_at - DateTime.now) / 1.day).round
    else
      Float::INFINITY
    end
  end

  private

  def check_if_already_participating
    throw(:abort) if self.game.participants.where(user_id: self.user.id).any?
  end
end
