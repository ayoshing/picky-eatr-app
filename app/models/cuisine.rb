class Cuisine < ApplicationRecord
  has_many :restaurants
  has_many :cuisines_preferences
  has_many :preferences, through: :cuisines_preferences

  validates :name, uniqueness: true


end
