require 'rails_helper'

RSpec.describe Invitation, type: :model do
  context 'validation tests' do
    let(:nation) { create(:nation) }
    let(:user) { create(:user) }
    it 'saves successfully' do
      game = create(:game, user: user, nation_id: nation.id)
      invitation = build(:invitation, game: game).save
      expect(invitation).to eq(true)
    end
    context 'no email present' do
      it 'ensures user presence' do
        game = create(:game, user: user, nation_id: nation.id)
        invitation = build(:invitation, email: nil, game: game).save
        expect(invitation).to eq(false)
      end
    end
    context 'user already participant of game' do
      it 'does not create invitation' do
        game = create(:game, user: user, nation_id: nation.id)
        invitation = build(:invitation, email: nil, user: user, game: game).save
        expect(invitation).to eq(false)
      end
    end
    context 'user already invited to game' do
      it 'does not create invitation' do
        game = create(:game, user: user, nation_id: nation.id)
        another_user = create(:another_user)
        invitation1 = create(:invitation, email: nil, user: another_user, game: game)
        invitation2 = build(:invitation, email: nil, user: another_user, game: game).save
        expect(invitation2).to eq(false)
      end
    end
  end

  context 'scope tests' do
    let(:nation) { create(:nation) }
    let(:user) { create(:user) }
    let(:game) { create(:game, user: user, nation_id: nation.id) }
    let(:unaccepted_invitation) { create(:invitation, game: game) }
    let(:accepted_invitation) { create(:another_invitation, game: game, accepted: true) }
    it 'scopes accepted invitations' do
      expect(Invitation.accepted).to match_array([accepted_invitation])
    end
    it 'scopes unaccepted invitations' do
      expect(Invitation.unaccepted).to match_array([unaccepted_invitation])
    end
  end

  context 'association tests' do
    let(:nation) { create(:nation) }
    let(:user) { create(:user) }
    let(:another_user) { create(:another_user) }
    let(:game) { create(:game, user: user, nation_id: nation.id) }
    let(:invitation) { create(:invitation, email: nil, user: another_user, game: game) }
    it 'belongs to a game' do
      expect(invitation.game).to eq(game)
    end
    it 'belongs to a user' do
      expect(invitation.user).to eq(another_user)
    end
  end
end
