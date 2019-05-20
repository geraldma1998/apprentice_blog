# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

end
