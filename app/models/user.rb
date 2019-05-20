# frozen_string_literal: true

class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :person, dependent: :destroy
  accepts_nested_attributes_for :person
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { in: 1..50 },
                       format: { with: /\A[a-zA-Z0-9]*\z/,
                                 message: "has invalid character." },
                       presence: true,
                       uniqueness: true

  validates :password, presence: true

end
