class Invitation < ApplicationRecord
  after_create_commit :associate_with_user

  belongs_to :game
  belongs_to :user, optional: true

  validates :email, presence: true, unless: lambda { |invitation| invitation.user.present? }

  scope :accepted, -> { where(accepted: true) }
  scope :unaccepted, -> { where(accepted: false) }

  def accept
    self.update_attributes(accepted: true)
    return Participant.new(game: self.game, user: self.user || User.find_by(email: self.email))
  end

  private

  def associate_with_user
    self.update_attributes(user: User.find_by(email: self.email)) unless self.user.present?
  end
end
