# frozen_string_literal: true

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9]*\z/,
                                 message: "has invalid characters." },
                       uniqueness: true,
                       length: { in: 1..50 }

end
