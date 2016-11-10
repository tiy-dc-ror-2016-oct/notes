class Panda
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def weight
    50
  end
end

class Dog
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def weight
    10
  end
end

zoo = [Dog.new("Ziggy"), Panda.new("Moose")]

zoo.sum do |animal|
  animal.weight
end
