class Preference < ApplicationRecord
  belongs_to :user
  has_one :cuisine 
end
