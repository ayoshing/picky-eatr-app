class Restaurant < ApplicationRecord
  belongs_to :favorite
  # has_many :users, through: :favorites
  belongs_to :cuisine
end
