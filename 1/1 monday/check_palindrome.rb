# Take input from user and check to see if it is a palindrome.
#
puts "Hi this program is going to determine if the word you provide is a palindrome"
puts "Please enter a word."
word = gets.chomp.downcase.gsub(" ", "")

# Reverse the word
reversed_word = word.reverse

if word == reversed_word
  puts "Your word is a palindrome"
else
  puts "Your word is NOT a palindrome 😭"
end
