require 'ffaker'
require 'pry'

keywords = ["clinton", "trump", "buckwort"]
messages = 10000.times.map { FFaker::DizzleIpsum.phrase }

regexish_string = keywords.join("|")

messages_about_keywords = []
messages.each do |msg|
  messages_about_keywords << msg if msg.match(/#{regexish_string}/)
end

messages_about_keywords = messages.select { |el| el.match(/#{regexish_string}/) }


binding.pry

puts "All Done"
