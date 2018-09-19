class Match < ApplicationRecord
  belongs_to :cuisine
    def self.get_random(array)
      random = array.sample
      array.delete(random)
      random
    end
end
