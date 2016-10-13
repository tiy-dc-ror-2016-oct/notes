require "set"

phone_book = {}

def repeatedly_ask_a_question(person, info_type)
  loop do
    puts "Please might you grant me your #{info_type}?"
    info = gets.chomp

    if person[info_type].include?(info)
      puts "I have that info"
    end

    person[info_type] << info

    puts "Do you want to continue entering #{info_type}? (y/n)"
    continue = gets.chomp.downcase


    break unless continue == "y"
  end

  return person
end

loop do
  puts "Who are we entering phone numbers for?"
  name = gets.chomp

  phone_book[name] = {
    "phone_numbers" => Set.new,
    "emails" => Set.new
  }


  phone_book[name] = repeatedly_ask_a_question(phone_book[name], "phone_numbers")
  phone_book[name] = repeatedly_ask_a_question(phone_book[name], "emails")

  puts "Do you want to continue? (y/n)"
  continue = gets.chomp.downcase

  puts "_" * 80
  p phone_book
  puts "_" * 80

  unless continue == "y"
    break
  end
end
