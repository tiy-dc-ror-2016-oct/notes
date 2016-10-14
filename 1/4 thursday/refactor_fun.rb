def clean_card_input(card, hand_type = "hard")
  case card.downcase
  when "a"
    ace_value_for_type(hand_type)
  when "k", "q", "j"
    10
  else
    card.to_i
  end
end

def ace_value_for_type(type)
  if hand_type == "hard"
    11
  else
    1
  end
end

clean_card_input("5", "soft")
clean_card_input("a", "hard")
