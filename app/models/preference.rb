class Preference < ApplicationRecord
  belongs_to :user
  has_many :cuisines_preferences
  has_many :cuisines, through: :cuisines_preferences
  belongs_to :author, class_name: "User"
  validates :author, presence: true

end
