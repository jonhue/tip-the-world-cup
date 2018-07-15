class Nation < ApplicationRecord
  WINNER = Nation.find_by(name: 'France')
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :flag
  has_many :participants

  validates :name, presence: true, uniqueness: true

  def matches
    Match.where('home_id = ? OR away_id = ?', self.id, self.id)
  end
end
