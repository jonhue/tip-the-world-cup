require 'rails_helper'

RSpec.describe Tip, type: :model do
  context 'validation specs' do
    let(:game) { create(:game) }
    let(:user) { create(:user) }
    let(:nation) { create(:nation) }
    let(:another_nation) { create(:another_nation) }
    it 'ensures home_goals presence' do
      participant = create(:participant, game: game, user: user, nation: nation)
      match = create(:match, home: nation, away: another_nation)
      tip = build(:tip, away_goals: 1, participant: participant, match: match).save
      expect(tip).to eq(false)
    end
    it 'ensures away_goals presence' do
      participant = create(:participant, game: game, user: user, nation: nation)
      match = create(:match, home: nation, away: another_nation)
      tip = build(:tip, home_goals: 2, participant: participant, match: match).save
      expect(tip).to eq(false)
    end
    it 'ensures participant presence' do
      match = create(:match, home: nation, away: another_nation)
      tip = build(:tip, home_goals: 2, away_goals: 1, match: match).save
      expect(tip).to eq(false)
    end
    it 'ensures match presence' do
      participant = create(:participant, game: game, user: user, nation: nation)
      tip = build(:tip, home_goals: 2, away_goals: 1, participant: participant).save
      expect(tip).to eq(false)
    end
    it 'saves successfully' do
      participant = create(:participant, game: game, user: user, nation: nation)
      match = create(:match, home: nation, away: another_nation)
      tip = build(:tip, home_goals: 2, away_goals: 1, participant: participant, match: match).save
      expect(tip).to eq(true)
    end
    context 'participant already tipped match' do
      let(:game) { create(:game) }
      let(:user) { create(:user) }
      let(:nation) { create(:nation) }
      let(:another_nation) { create(:another_nation) }
      let(:participant) { create(:participant, game: game, user: user, nation: nation) }
      let(:match) { create(:match, home: nation, away: another_nation) }
      let(:tip) { create(:tip, home_goals: 2, away_goals: 1, participant: participant, match: match) }
      it 'does not save another tip' do
        another_tip = build(:tip, home_goals: 2, away_goals: 1, participant: participant, match: match).save
        expect(another_tip).to eq(false)
      end
    end
  end

  context 'association tests' do
    let(:game) { create(:game) }
    let(:user) { create(:user) }
    let(:nation) { create(:nation) }
    let(:another_nation) { create(:another_nation) }
    let(:participant) { create(:participant, game: game, user: user, nation: nation) }
    let(:match) { create(:match, home: nation, away: another_nation) }
    let(:tip) { create(:tip, home_goals: 2, away_goals: 1, participant: participant, match: match) }
    it 'belongs to a participant' do
      expect(tip.participant).to eq(participant)
    end
    it 'belongs to a match' do
      expect(tip.match).to eq(match)
    end
  end

  describe '#goal_difference' do
  end

  describe '#earned_points' do
  end

  describe '#match?' do
  end

  describe '#goal_difference?' do
  end

  describe '#tendency?' do
  end
end
