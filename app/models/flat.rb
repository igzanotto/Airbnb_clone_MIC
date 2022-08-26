class Flat < ApplicationRecord
  belongs_to :user

  CATEGORIES = ["House", "Apartment", "Island", "Cabin", "Yatch"]
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 20, maximum: 400 }
  validates :location, presence: true
  validates :photo, presence: true
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def blank_stars
    5 - ratings.to_i
  end
end
