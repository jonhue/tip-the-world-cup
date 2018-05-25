class Game < ApplicationRecord
  after_create_commit :add_first_participant

  belongs_to :user
  has_many :participants

  validates :name, presence: true
  validates :bet, numericality: true
  validates :rule_match, numericality: true
  validates :rule_goal_difference, numericality: true
  validates :rule_tendency, numericality: true
  validates :rule_miss, numericality: true

  scope :personal, -> { where(private: true) }
  scope :shared, -> { where(private: false) }

  attr_accessor :nation_id

  private

  def add_first_participant
    self.participants.build(user: self.user, nation: Nation.find(self.nation_id)).save!
  end
end
