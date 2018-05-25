require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = create(:user)
      nation = create(:nation)
      game = build(:game, name: nil, nation_id: nation.id).save
      expect(game).to eq(false)
    end
    it 'ensures nation_id presence' do
      user = create(:user)
      game = build(:game).save
      expect(game).to eq(false)
    end
    it 'ensures user presence' do
      nation = create(:nation)
      game = build(:game, nation_id: nation.id).save
      expect(game).to eq(false)
    end
    it 'saves successfully' do
      user = create(:user)
      nation = create(:nation)
      game = build(:game, user: user, nation_id: nation.id).save
      expect(game).to eq(true)
    end
  end

  context 'scope tests' do
    let(:user) { create(:user) }
    let(:nation) { create(:nation) }
    let(:personal_game) { create(:game, user: user, nation_id: nation.id) }
    let(:shared_game) { create(:game, user: user, nation_id: nation.id, private: false) }
    it 'scopes shared games' do
      expect(Game.shared).to match_array([shared_game])
    end
    it 'scopes personal games' do
      expect(Game.personal).to match_array([personal_game])
    end
  end

  context 'association tests' do
    let(:user) { create(:user) }
    let(:nation) { create(:nation) }
    let(:game) { create(:game, user: user, nation_id: nation.id) }
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
  end
end
