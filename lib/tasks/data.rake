namespace :data do
  desc "Update match data."
  task fetch: :environment do
    system('rails db:seed')
  end
end
