def verse(verse_number)
  phrases = {
    1 => "a Partridge in a Pear Tree",
    2 => "Two Turtle Doves",
    3 => "Three French Hens",
    4 => "Four Calling Birds",
    5 => "Five Golden Rings",
    6 => "Six Geese a Laying",
    7 => "Seven Swans a Swimming",
    8 => "Eight Maids a Milking",
    9 => "Nine Ladies Dancing",
    10 => "Ten Lords a Leaping",
    11 => "Eleven Pipers Piping",
    12 => "12 Drummers Drumming"
  }

  days = {
    1 => "First",
    2 => "Second",
    3 => "Third",
    4 => "Fourth",
    5 => "Fifth",
    6 => "Sixth",
    7 => "Seventh",
    8 => "Eighth",
    9 => "Ninth",
    10 => "Tenth",
    11 => "Eleventh",
    12 => "Twelfth"
  }

  puts "On the #{days[verse_number]} day of Christmas, my true love sent to me"

  (1..verse_number).to_a.reverse.each do |current_verse|
    print "and " if current_verse == 1 && verse_number != 1
    print phrases[current_verse]
    print "." if current_verse == 1
    puts ""
  end
end

def entire_song
  12.times.each_with_index do |i|
    verse i + 1
  end
end

# entire_song
