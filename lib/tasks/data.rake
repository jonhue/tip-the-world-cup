namespace :data do
  desc "Update match data."
  task fetch: :environment do
    FifaWorldCupData::Match.new.perform
    Match.live&.each do |match|
      Livescore.new.perform(match: match)
    end
  end
end
