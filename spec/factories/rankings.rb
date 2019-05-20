# frozen_string_literal: true

FactoryBot.define do
  factory :ranking do
    rank { 1 }
    user
    post
  end
end
