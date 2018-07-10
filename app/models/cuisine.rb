class Cuisine < ApplicationRecord
  has_many :restaurants
  has_one :preference

  validates :name, uniqueness: true


end
