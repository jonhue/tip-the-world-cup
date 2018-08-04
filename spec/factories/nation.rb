# frozen_string_literal: true

FactoryBot.define do
  factory :nation do
    name 'Germany'
  end
  factory :another_nation, class: Nation do
    name 'France'
  end
end
