require 'rails_helper'

RSpec.describe Nation, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      nation = build(:nation, name: nil).save
      expect(nation).to eq(false)
    end
    it 'saves successfully' do
      nation = build(:nation).save
      expect(nation).to eq(true)
    end
  end

  context 'association tests' do
    let(:nation) { create(:nation) }
    it 'has one attached flag' do
      nation.flag.attach(io: File.open('../resources/flag.png'))

      expect(nation.flag.attached?).to eq(true)
    end
    it 'has many matches' do
      another_nation = create(:another_nation)
      match1, match2 = create_list(:match, 2, home: nation, away: another_nation)

      expect(nation.matches).to match_array([match1, match2])
    end
    it 'has many participants' do
      user = create(:user)
      another_user = create(:another_user)
      game = create(:game, user: user)
      participant = create(:participant, user: user, game: game, nation: nation)
      another_participant = create(:participant, user: another_user, game: game, nation: nation)

      expect(nation.participants).to match_array([participant, another_participant])
    end
  end
end
