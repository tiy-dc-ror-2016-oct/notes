class Test
  def go
    "i refuse"  # => "i refuse", "i refuse", "i refuse"
    blow_up
  end           # => :go

  def blow_up
    raise NoMethodError, "NOOOOOOOOOOOOOOOO"
  end
end             # => :go

module Minitest
  class Test
    def go
      "went"     # => "went"
    end          # => :go
  end            # => :go

  ::Test.new.go  # => "i refuse"
end              # => "i refuse"



Minitest::Test.new.go  # => "went"
::Test.new.go          # => "i refuse"
Test.new.go            # => "i refuse"
