require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = build(:user, name: nil).save
      expect(user).to eq(false)
    end
    it 'ensures email presence' do
      user = build(:user, email: nil).save
      expect(user).to eq(false)
    end
    it 'ensures email format' do
      user = build(:user, email: 'user').save
      expect(user).to eq(false)
    end
    it 'ensures password presence' do
      user = build(:user, password: nil).save
      expect(user).to eq(false)
    end
    it 'ensures password format' do
      user = build(:user, password: '12345').save
      expect(user).to eq(false)
    end
    it 'saves successfully' do
      user = build(:user).save
      expect(user).to eq(true)
    end
  end

  context 'association tests' do
    let(:user) { create(:user) }
    it 'has many participants' do
      nation = create(:nation)
      game = create(:game, user: user)
      another_game = create(:another_game, user: user)
      participant1 = create(:participant, game: game, user: user, nation: nation)
      participant2 = create(:participant, game: another_game, user: user, nation: nation)

      expect(user.participants).to match_array([participant1, participant2])
    end
    it 'has many games through participants' do
      nation = create(:nation)
      game1 = create(:game, user: user)
      game2 = create(:another_game, user: user)
      participant = create(:participant, game: game1, user: user, nation: nation)
      another_participant = create(:participant, game: game2, user: user, nation: nation)

      expect(user.games).to match_array([game1, game2])
    end
    it 'has many administrating games' do
      game1 = create(:game, user: user)
      game2 = create(:another_game, user: user)

      expect(user.administrating_games).to match_array([game1, game2])
    end
    it 'has many invitations' do
      game = create(:game, user: user)
      another_game = create(:another_game, user: user)
      invitation1 = create(:invitation, user: user, gme: game)
      invitation2 - create(:another_invitation, user: user, gme: another_game)

      expect(user.invitations).to match_array([invitation1, invitation2])
    end
  end
end
