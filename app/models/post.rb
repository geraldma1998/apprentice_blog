# frozen_string_literal: true

class Post < ApplicationRecord

  belongs_to :user

  has_many :posts_categories, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, length: { in: 1..100 },
                    presence: true

  validates :content, presence: true

  validates :opened, presence: true

  def self.get_users_from_post_comments(post_id)
    users_comments = Post.find(post_id).comments.select(:user_id).group(:user_id)
    users = []
    users_comments.each do |user|
      users << User.find(user.user_id)
    end
    users
  end

end
