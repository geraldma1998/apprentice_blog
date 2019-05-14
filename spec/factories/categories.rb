# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::JapaneseMedia::OnePiece.unique.character }
  end
end
