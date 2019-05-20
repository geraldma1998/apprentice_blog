# frozen_string_literal: true

class Category < ApplicationRecord

  has_many :posts_categories, dependent: :destroy

  validates :name, length: { in: 1..50 },
                   presence: true,
                   uniqueness: true

end
