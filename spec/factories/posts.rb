FactoryBot.define do
  factory :post do
    title { Faker::JapaneseMedia::OnePiece.unique.character }
    content { Faker::JapaneseMedia::OnePiece.unique.quote }
    opened { true }
  end
end
