FactoryBot.define do
  factory :user do
    email 'user@example.com'
    password 'password'
    name 'User'
  end
  factory :another_user do
    email 'another_user@example.com'
    password 'password'
    name 'Another User'
  end
end
