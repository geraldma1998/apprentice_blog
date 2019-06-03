# frozen_string_literal: true

class Category < ApplicationRecord

  has_many :posts_categories, dependent: :destroy
  has_many :posts, through: :posts_categories

  validates :name, length: { in: 1..50 },
                   presence: true,
                   uniqueness: true

end
