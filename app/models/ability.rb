# frozen_string_literal: true

class Ability
  include CanCan::Ability

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def initialize(user)
    can :read, Game, private: false
    can :read, Game, participants: { user_id: user.id }
    can :manage, Game, user_id: user.id

    can :read, Tip do |tip|
      tip.match.begins_at.past?
    end
    can :manage, Tip, participant: { user_id: user.id }

    can :read, Participant, game: { participants: { user_id: user.id } }
    can :read, Participant, game: { private: false }
    can :manage, Participant, user_id: user.id

    can :read, Nation

    can :read, Match

    can :manage, Invitation, user_id: user.id

    can :read, Notification, target_type: 'User', target_id: user.id
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
