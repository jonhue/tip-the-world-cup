class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :participants, dependent: :destroy
  has_many :games, through: :participants
  has_many :administrating_games, class_name: 'Game', dependent: :destroy
  has_many :invitations, dependent: :destroy
end
