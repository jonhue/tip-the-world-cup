class Ability
  include CanCan::Ability

  def initialize user
    can :read, Game, private: false
    can :read, Game, participants: { user_id: user.id }
    can :manage, Game, user_id: user.id

    can :manage, Tip, participant: { user_id: user.id }

    can :read, Participant, game: { participants: { user_id: user.id } }
    can :read, Participant, game: { private: false }
    can :manage, Participant, user_id: user.id

    can :read, Nation

    can :read, Match

    can :manage, Invitation, user_id: user.id

    can :read, Notification, target_type: 'User', target_id: user.id
  end
end
