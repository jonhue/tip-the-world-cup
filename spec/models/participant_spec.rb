require 'rails_helper'

RSpec.describe Participant, type: :model do
  context 'validation tests' do
    it 'ensures game presence' do
      user = create(:user)
      nation = create(:nation)
      participant = build(:participant, user: user, nation: nation).save
      expect(participant).to eq(false)
    end
    it 'ensures user presence' do
      user = create(:user)
      nation = create(:nation)
      game = create(:game, user: user, nation_id: nation.id)
      participant = build(:participant, game: game, nation: nation).save
      expect(participant).to eq(false)
    end
    it 'ensures nation presence' do
      user = create(:user)
      nation = create(:nation)
      game = create(:game, user: user, nation_id: nation.id)
      participant = build(:participant, game: game, user: user).save
      expect(participant).to eq(false)
    end
    it 'saves successfully' do
      user = create(:user)
      nation = create(:nation)
      game = create(:game, user: user, nation_id: nation.id)
      participant = build(:participant, game: game, user: user, nation: nation).save
      expect(participant).to eq(true)
    end
    context 'user already participates in a game' do
      let(:user) { create(:user) }
      let(:nation) { create(:nation) }
      let(:game) { create(:game, user: user, nation_id: nation.id) }
      let(:participant) { create(:participant, game: game, user: user, nation: nation) }
      it 'does not allow another participation' do
        another_participant = build(:participant, game: game, user: user, nation: nation).save
        expect(another_participant).to eq(false)
      end
    end
  end

  context 'association tests' do
    let(:user) { create(:user) }
    let(:nation) { create(:nation) }
    let(:game) { create(:game, user: user, nation_id: nation.id) }
    let(:participant) { create(:participant, game: game, user: user, nation: nation) }
    it 'belongs to a game' do
      expect(participant.game).to eq(game)
    end
    it 'belongs to a user' do
      expect(participant.user).to eq(user)
    end
    it 'belongs to a nation' do
      expect(participant.nation).to eq(nation)
    end
    it 'has many tips' do
      another_nation = create(:another_nation)
      match = create(:match, home: nation, away: another_nation)
      another_match = create(:match, home: nation, away: another_nation)
      tip1 = create(:tip, participant: participant, match: match)
      tip2 = create(:tip, participant: participant, match: another_match)

      expect(participant.tips).to match_array([tip1, tip2])
    end
  end
end
