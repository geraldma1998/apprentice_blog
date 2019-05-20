# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  has_many :posts_categories, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

end
