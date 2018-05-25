class Nation < ApplicationRecord
  has_one_attached :flag
  has_many :matches
  has_many :participants
end
