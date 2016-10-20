require 'pry'
# [1,2].each do  # => [1, 2]
#   puts "hi"    # => nil, nil
# end            # => [1, 2]

# Proc.new
def party_poodle(other_args=0, &passed_in_code)
  passed_in_code.call
end            # => :interface


party_poodle { `say hi` }  # => ""
party_poodle(1) do
  `say bye`
end

def singer_boy(array)
  array.each do |el|
    return if el == 'poodle'
  end
end

singer_boy(["poodle"])
