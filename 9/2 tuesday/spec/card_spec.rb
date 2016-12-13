require_relative "../card"

RSpec.describe Card do
  subject(:card) { described_class.new("A", :spades) }

  it "has a face" do
    expect(card.face).to eq("A")
  end

  it "has a suit" do
    expect(card.suit).to eq(:spades)
  end
end
