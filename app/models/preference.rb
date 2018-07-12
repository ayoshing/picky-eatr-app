class Preference < ApplicationRecord
  belongs_to :user
  has_many :cuisines_preferences
  has_many :cuisines, through: :cuisines_preferences

  def matchup(array)
    # matches = []
    # # pick = ""
    #
    # rand_two = array.sample(2)
    # rand_two.each do |num|
    #   array.delete(num)
    # end
    # matches = rand_two
    # until array.length == 0 do
    #   puts "Pick selection: #{matches[0].name} or #{matches[1].name}"
    #   pick = gets.chomp
    #   matches = [pick]
    #   rand_one = array.sample
    #   array.delete(rand_one)
    #   matches << rand_one
    # end
  end
end
