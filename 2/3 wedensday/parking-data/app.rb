require 'csv'
require 'pry'

tickets = CSV.read("data/moving_feb_2016.csv", {headers: true})

puts "Welcome to DC Traffic and Moving Violations Data"

puts "We issued #{tickets.size} of tickets"

speeding_tickets = tickets.select{ |ticket| ticket["VIOLATIONDESC"].match(/OVER THE SPEED LIMIT/)}

speeding_violation_desc = speeding_tickets.map { |el| el["VIOLATIONDESC"]}

#
# speeds = []
# speeding_violation_desc.each do |el|
#   speeds << el.scan(/\d+/).last.to_i
# end
slow_speeds = speeding_violation_desc.map { |el| el.scan(/\d+/).first.to_i }

fast_speeds = speeding_violation_desc.map { |el| el.scan(/\d+/).last.to_i }


# total_speed = 0
# speeds.each do |el|
#   total_speed = total_speed + el
# end

slow = slow_speeds.reduce(0) {|acc, el| acc + el }
fast = fast_speeds.reduce(:+)

puts "The starship DC is traveling between #{slow}-#{fast}"

puts "Thank you for working with DC Data"
