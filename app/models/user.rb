class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :flats
  has_many :reservations

  validates :name, uniqueness: { scope: :name, message: "username already taken" }
  validates :email, uniqueness: { scope: :email, message: "email already has an account" }
end
