class Game < ApplicationRecord
  after_create_commit :add_first_participant

  belongs_to :user
  has_many :participants


  attr_accessor :nation_id

  private

  def add_first_participant
    self.participants.build(user: self.user, nation: Nation.find(self.nation_id)).save!
  end
end
