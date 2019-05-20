# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    identification { 1 }
    phone_number { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    user
  end
end
