FactoryBot.define do
  factory :game do
    name 'Game'
  end
  factory :another_game, class: Game do
    name 'Another Game'
  end
end
