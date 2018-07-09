class Cuisine < ApplicationRecord
  has_many :restaurants
  belongs_to :preference
end
