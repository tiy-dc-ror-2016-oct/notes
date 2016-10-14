
def check_hand_type(card_one, card_two)
  if card_one == card_two                                     # => true
    "pair"                                                    # => "pair"
  elsif card_one.downcase == "a" || card_two.downcase == "a"
    "soft"
  else
    "hard"
  end                                                         # => "pair"
end                                                           # => :check_hand_type

check_hand_type(5, 5)  # => "pair"

def i_am_tricky
  "tricky"       # => "tricky"
end              # => :i_am_tricky

i_am_tricky  # => "tricky"
