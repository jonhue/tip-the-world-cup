class Tip < ApplicationRecord
  belongs_to :participant
  belongs_to :match
end
