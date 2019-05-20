# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    identification { 1 }
    phone_number { "88888888" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    user
  end
end
