require 'pry'

preference = ["a", "b", "c", "d", "e", "f", "g"]

def match(array)
  matches = []
  pick = ""

  rand_two = array.sample(2)
  rand_two.each do |num|
    array.delete(num)
  end
  matches = rand_two
  until array.length == 0 do
    puts "Pick selection: #{matches[0]} or #{matches[1]}"
    pick = gets.chomp
    matches = [pick]
    rand_one = array.sample
    array.delete(rand_one)
    matches << rand_one
  end

  puts "Winner is #{pick}"

end

puts "hello"
match(preference)
