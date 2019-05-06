class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, length: { in: 1..50 },
                       format: { with: /\A[a-zA-Z0-9]*\z/, 
                                 message: "has invalid character." },
                       presence: true,
                       uniqueness: true
end
