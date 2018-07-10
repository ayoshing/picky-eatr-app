class Preference < ApplicationRecord
  belongs_to :user
  has_many :cuisines_preferences
  has_many :cuisines, through: :cuisines_preferences
end
