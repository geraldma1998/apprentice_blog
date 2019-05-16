# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::JapaneseMedia::OnePiece.unique.character }
    content { Faker::JapaneseMedia::OnePiece.quote }
    opened { true }
    user
  end
end
