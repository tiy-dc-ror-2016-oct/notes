def is_number?(value)
  value.to_f.to_s != "0.0" || (value == "0.0" || value == "0")  # => true, true, false, false
end                                                             # => :is_number?


is_number?("1")     # => true
is_number?("1.0")   # => true
is_number?("asdf")  # => false
is_number?("ruby")  # => false


def greeter(name = "class")
  return "Hello #{name}!"    # => "Hello class!", "Hello russell!", "Hello alex!", "Hello allie!", "Hello farimah!", "Hello ben!"
end                          # => :greeter

#def greeter              # ~> ArgumentError: wrong number of arguments (given 1, expected 0)
#  return "Hello class!"  # => "Hello class!"
#end                      # => :greeter

def 💩
 return "poop"  # => "poop"
end             # => :💩
💩               # => "poop"

greeter             # => "Hello class!"
greeter("russell")  # => "Hello russell!"

["alex", "allie", "farimah", "ben"].each do |human|  # => ["alex", "allie", "farimah", "ben"]
  greeter(human)                                     # => "Hello alex!", "Hello allie!", "Hello farimah!", "Hello ben!"
end                                                  # => ["alex", "allie", "farimah", "ben"]

animals = ["moose", "bear"]  # => ["moose", "bear"]

animals[8] = "tacocat"    # => "tacocat"
animals.each do |animal|  # => ["moose", "bear", nil, nil, nil, nil, nil, nil, "tacocat"]
  puts animal.reverse            # => nil, nil, nil, nil, nil, nil, nil, nil, nil
end                       # => ["moose", "bear", nil, nil, nil, nil, nil, nil, "tacocat"]



# i_am_a_undefined_variable #< will blow up
# iAmAUndefinedVariable
# IAmAUnderfinedVariable

# >> moose
# >> bear
# >>
# >>
# >>
# >>
# >>
# >>
# >> tacocat
