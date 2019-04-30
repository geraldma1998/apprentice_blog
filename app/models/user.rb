class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, format: { with: /\A[a-zA-Z0-9]*\z/, 
  																							 message: "has invalid character."}
  validates_length_of :username, minimum: 1, maximum: 30

end
