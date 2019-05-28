# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  has_many :posts_categories, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :categories, through: :posts_categories
  has_many :users, through: :comments

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

end
