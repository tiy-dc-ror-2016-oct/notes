require_relative "test_helper"

class AnimalTest < Minitest::Test
  def test_exists
    Animal
  end

  def test_create_animal
    ziggy = Animal.new(name: "Ziggy", born_on: Date.new(2015, 8, 20), species: "Canine")
    assert ziggy.save!
  end
end
