class Participant < ApplicationRecord
  belongs_to :game
  belongs_to :user
  belongs_to :nation
  has_many :tips
end
