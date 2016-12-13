require_relative "../card"

RSpec.describe Card do
  
  before(:each) do
    @card = Card.new("A", :spades)
  end

  it "has a face" do
    expect(@card.face).to eq("A")
  end

  it "has a suit" do
    expect(@card.suit).to eq(:spades)
  end
end
