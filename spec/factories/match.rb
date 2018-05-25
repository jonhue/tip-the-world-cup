FactoryBot.define do
  factory :match do
    home_goals 2
    away_goals 1
    begins_at 1.day.ago
  end
end
