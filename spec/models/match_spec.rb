require 'rails_helper'

RSpec.describe Match, type: :model do
  context 'validation tests' do
    it 'ensures begins_at presence' do
      nation = create(:nation)
      another_nation = create(:another_nation)
      match = build(:match, begins_at: nil, home: nation, away: another_nation).save
      expect(match).to eq(false)
    end
    it 'ensures home presence' do
      nation = create(:nation)
      match = build(:match, away: nation).save
      expect(match).to eq(false)
    end
    it 'ensures away presence' do
      nation = create(:nation)
      match = build(:match, home: nation).save
      expect(match).to eq(false)
    end
    it 'saves successfully' do
      nation = create(:nation)
      another_nation = create(:another_nation)
      match = build(:match, home: nation, away: another_nation).save
      expect(match).to eq(true)
    end
  end

  context 'scope tests' do
    let(:nation) { create(:nation) }
    let(:another_nation) { create(:another_nation) }
    let(:past_match) { create(:match, begins_at: 1.day.ago, home: nation, away: another_nation) }
    let(:future_match) { create(:match, begins_at: 1.day.from_now, home: nation, away: another_nation) }
    it 'scopes past matches' do
      expect(Match.past).to match_array([past_match])
    end
    it 'scopes future matches' do
      expect(Match.future).to match_array([future_match])
    end
  end

  context 'association tests' do
    let(:nation) { create(:nation) }
    let(:another_nation) { create(:another_nation) }
    let(:match) { create(:match, home: nation, away: another_nation) }
    it 'belongs to a home nation' do
      expect(match.home).to eq(nation)
    end
    it 'belongs to an away nation' do
      expect(match.away).to eq(another_nation)
    end
    it 'has many tips' do
      nation = create(:nation)
      user = create(:user)
      game = create(:game, user: user)
      another_user = create(:another_user)
      participant = create(:participant, user: user, game: game, nation: nation)
      another_participant = create(:participant, user: another_user, game: game, nation: nation)
      tip1 = create(:tip, participant: participant, match: match)
      tip2 = create(:tip, participant: another_participant, match: match)

      expect(match.tips).to match_array([tip1, tip2])
    end
  end

  describe '#goals_available?' do
  end

  describe '#goal_difference' do
  end
end
