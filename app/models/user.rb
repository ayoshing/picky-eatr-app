class User < ApplicationRecord
  has_many :preferences
  has_many :cuisines, through: :preferences
  has_many :favorites
  has_many :restaurants, through: :favorites
  validates_uniqueness_of :username
  # has_many :secrets, foreign_key: 'author_id'
  has_secure_password
end
