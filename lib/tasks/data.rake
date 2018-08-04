# frozen_string_literal: true

namespace :data do
  desc 'Update match data.'
  task fetch: :environment do
    FifaWorldCupData::Match.new.perform
    Match.live&.each do |match|
      Livescore.new(match: match).perform
    end
  end
end
