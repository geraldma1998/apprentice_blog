# frozen_string_literal: true

class Post < ApplicationRecord

  belong_to :user

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

end
