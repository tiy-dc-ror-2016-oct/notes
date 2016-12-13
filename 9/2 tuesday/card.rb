class Card
  attr_reader :face, :suit
  def initialize(face, suit)
    @face, @suit = face, suit
  end
end
