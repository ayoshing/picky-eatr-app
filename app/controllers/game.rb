require 'pry'

preference = ["a", "b", "c", "d", "e", "f", "g"]

def match(array)
  puts array
  matches = []
  pick = ""

  rand_two = array.sample(2)
  rand_two.each do |num|
    array.delete(num)
  end
  matches << rand_two
  binding.pry
  until matches.length == 1 do
    puts matches
    # if pick == matches[0]
    #   matches.pop
    # else
    #   matches.shift
    # end
    pick = gets.chomp
    matches = [pick]
    rand_one = array.sample
    match << rand_one
    array.delete(rand_one)
  end

end

puts "hello"
match(preference)
