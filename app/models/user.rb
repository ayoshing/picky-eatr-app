class User < ApplicationRecord
  has_many :preferences
  has_many :cuisines, through: :preferences
  has_many :favorites
  has_many :restaurants, through: :favorites
end
