class Nation < ApplicationRecord
  has_one_attached :flag
  has_many :participants

  validates :name, presence: true

  def matches
    Match.where("home_id = ? OR away_id = ?", self.id, self.id)
  end
end
