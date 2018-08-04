# frozen_string_literal: true

class Invitation < ApplicationRecord
  before_validation :create_token, on: :create
  before_create :check_if_already_participating
  after_create :associate_with_user
  after_create_commit :send_invitation

  belongs_to :game
  belongs_to :user, optional: true

  validates :email, presence: true, unless: lambda { |invitation|
    invitation.user.present?
  }
  validates :token, presence: true, uniqueness: true

  scope :accepted, -> { where(accepted: true) }
  scope :unaccepted, -> { where(accepted: false) }

  def accept
    update!(accepted: true)
    Participant.new(game: game, user: user || User.find_by(email: email))
  end

  private

  def create_token
    loop do
      self.token = SecureRandom.hex
      break unless self.class.where(token: token).exists?
    end
  end

  def check_if_already_participating
    return unless game.participants.where(user_id: user&.id).any? ||
                  game.participants.includes(:user)
                      .where(users: { email: email }).any?

    throw(:abort)
  end

  def associate_with_user
    update_columns(user_id: User.find_by(email: email)&.id) unless user.present?
  end

  def send_invitation
    InvitationMailer.invitation(game.user, self).deliver
  end
end
