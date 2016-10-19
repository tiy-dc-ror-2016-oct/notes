def convert_to_number(string)
  begin
    Float(string)                                                                # => 0.1
  rescue => e
    # We can capture the error object an do things with it.
    puts "Couldn't convert because a #{e.class} with a message of #{e.message}"  # => nil, nil
    nil                                                                          # => nil, nil
  ensure
    # We can clean up after an error (this does not effect the return value)
    "trolllllly"                                                                 # => "trolllllly", "trolllllly", "trolllllly"
  end                                                                            # => 0.1, nil, nil
end                                                                              # => :convert_to_number

convert_to_number("0.1")     # => 0.1
convert_to_number("asdf")    # => nil
convert_to_number("12adsf")  # => nil

# >> Couldn't convert because a ArgumentError with a message of invalid value for Float(): "asdf"
# >> Couldn't convert because a ArgumentError with a message of invalid value for Float(): "12adsf"
