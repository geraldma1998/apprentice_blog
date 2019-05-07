# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(8).gsub(/[_\W]/, "") }
    email { Faker::Internet.email }
    password { "password123" }
  end
end
