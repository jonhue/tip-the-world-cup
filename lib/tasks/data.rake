namespace :data do
  desc "Update match data."
  task fetch: :environment do
    system('rails db:seed')
    Match.live&.each do |match|
      Livescore.new.perform(match: match)
    end
  end
end
