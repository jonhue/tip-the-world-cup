require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = create(:user)
      game = build(:game, name: nil).save
      expect(game).to eq(false)
    end
    it 'ensures user presence' do
      game = build(:game).save
      expect(game).to eq(false)
    end
    it 'saves successfully' do
      user = create(:user)
      game = build(:game, user: user).save
      expect(game).to eq(true)
    end
  end

  context 'scope tests' do
    let(:user) { create(:user) }
    let(:personal_game) { create(:game, user: user) }
    let(:shared_game) { create(:game, user: user, private: false) }
    it 'scopes shared games' do
      expect(Game.shared).to match_array([shared_game])
    end
    it 'scopes personal games' do
      expect(Game.personal).to match_array([personal_game])
    end
  end

  context 'association tests' do
    let(:user) { create(:user) }
    let(:game) { create(:game, user: user) }
    it 'belongs to a user' do
      expect(game.user).to eq(user)
    end
    it 'has many participants' do
      another_user = create(:another_user)
      nation = create(:nation)
      participant1 = create(:participant, user: user, game: game, nation: nation)
      participant2 = create(:participant, user: another_user, game: game, nation: nation)

      expect(game.participants).to match_array([participant1, participant2])
    end
    it 'has many invitations' do
      another_user = create(:another_user)
      invitation1 = create(:invitation, user: user, game: game)
      invitation2 - create(:another_invitation, user: another_user, game: game)

      expect(game.invitations).to match_array([invitation1, invitation2])
    end
  end
end
