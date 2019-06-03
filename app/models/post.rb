# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  has_many :posts_categories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, through: :posts_categories
  has_many :rankings, dependent: :destroy
  accepts_nested_attributes_for :posts_categories

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

  def users_in_comments
    comments.map(&:user).uniq
  end

  def ranking_value
    number_rankings = rankings.count
    if number_rankings.positive?
      rankings.sum(:rank) / number_rankings
    else
      0
    end
  end

end
