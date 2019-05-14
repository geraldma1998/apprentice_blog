# frozen_string_literal: true

class Category < ApplicationRecord

  validates :name, length: { in: 1..50 },
                   presence: true,
                   uniqueness: true

end
