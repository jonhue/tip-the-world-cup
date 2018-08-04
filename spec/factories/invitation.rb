# frozen_string_literal: true

FactoryBot.define do
  factory :invitation do
    email 'some_user@example.com'
    message 'Invitation'
  end
  factory :another_invitation, class: Invitation do
    email 'some_another_user@example.com'
    message 'Another Invitation'
  end
end
