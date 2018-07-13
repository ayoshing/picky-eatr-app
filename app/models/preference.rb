class Preference < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :cuisines_preferences
  has_many :cuisines, through: :cuisines_preferences
  validates :user, presence: true

end
