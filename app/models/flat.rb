class Flat < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["house", "apartment", "island", "cabin", "yatch"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 20, maximum: 400 }
  validates :location, presence: true

end
