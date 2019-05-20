# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    message { Faker::JapaneseMedia::OnePiece.quote }
    user
    post
  end
end
