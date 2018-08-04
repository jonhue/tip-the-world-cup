# frozen_string_literal: true

class Invitation < ApplicationRecord
  before_validation :create_token, on: :create
  before_create :check_if_already_participating
  after_create :associate_with_user
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

  def check_if_already_participating
    if self.user.present?
      throw(:abort) if self.game.participants.where(user_id: self.user.id).any?
    else
      throw(:abort) if self.game.participants.includes(:user).where(users: { email: self.email }).any?
    end
  end

  def associate_with_user
    self.update_columns(user_id: User.find_by(email: self.email)&.id) unless self.user.present?
  end

  def send_invitation
    InvitationMailer.invitation(self.game.user, self).deliver
  end
end
