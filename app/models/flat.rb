class Flat < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["House", "Apartment", "Island", "Cabin", "Yatch"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 20, maximum: 400 }
  validates :location, presence: true
  has_one_attached :photo
end
