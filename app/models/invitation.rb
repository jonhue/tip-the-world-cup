class Invitation < ApplicationRecord
  before_validation :create_token
  after_create_commit :associate_with_user
  after_create_commit :send_invitation

  belongs_to :game
  belongs_to :user, optional: true

  validates :email, presence: true, unless: lambda { |invitation| invitation.user.present? }
  validates :token, presence: true, uniqueness: true

  scope :accepted, -> { where(accepted: true) }
  scope :unaccepted, -> { where(accepted: false) }

  def accept
    self.update_attributes(accepted: true)
    return Participant.new(game: self.game, user: self.user || User.find_by(email: self.email))
  end

  private

  def create_token
    begin
      self.token = SecureRandom.hex
    end while self.class.where(token: self.token).exists?
  end

  def associate_with_user
    self.update_attributes(user: User.find_by(email: self.email)) unless self.user.present?
  end

  def send_invitation
    InvitationMailer.invitation(self.game.user, self).deliver
  end
end
