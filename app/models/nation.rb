class Nation < ApplicationRecord
  has_many :matches
  has_many :participants
end
