# frozen_string_literal: true

class Game < ApplicationRecord
  belongs_to :user
  has_many :participants, dependent: :destroy
  has_many :invitations, dependent: :destroy

  validates :name, presence: true
  validates :rule_match, numericality: true
  validates :rule_goal_difference, numericality: true
  validates :rule_tendency, numericality: true
  validates :rule_miss, numericality: true

  scope :personal, -> { where(private: true) }
  scope :shared, -> { where(private: false) }
end
