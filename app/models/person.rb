# frozen_string_literal: true

class Person < ApplicationRecord

  belongs_to :user

  validates :identification, presence: true

  validates :phone_number, length: { in: 1..9 },
                           presence: true

end
