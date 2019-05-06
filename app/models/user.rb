# frozen_string_literal: true

class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

<<<<<<< HEAD
  validates :username, length: { in: 1..50 },
                       format: { with: /\A[a-zA-Z0-9]*\z/,
                                 message: 'has invalid character.' },
                       presence: true,
                       uniqueness: true
=======
  validates :username, presence: true,
                       format: { with: /\A[a-zA-Z0-9]*\z/,
                                 message: "has invalid characters." },
                       uniqueness: true,
                       length: { in: 1..50 }

>>>>>>> 7e19421feb9347c27710fabe8046d0e78bb68196
end
