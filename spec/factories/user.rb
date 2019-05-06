# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.username(8).gsub(/[_\W]/, '') }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
  end
end
