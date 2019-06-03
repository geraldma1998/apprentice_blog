# frozen_string_literal: true

class User < ApplicationRecord

  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[admin client], multiple: false) ##
  ############################################################################################

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :rankings, dependent: :destroy
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
