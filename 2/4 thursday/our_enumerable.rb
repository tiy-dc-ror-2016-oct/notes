array = ["moose", "bear", "cat", "dog"]  # => ["moose", "bear", "cat", "dog"]

# def our_map(array)
#   new_array = []
#   array.each do |el|
#     new_array << yield(el)
#   end
#   new_array
# end
#
# def our_each(array)
#   i = 0
#   length = array.length
#   while i < length
#     yield(array[i])
#     i += 1
#   end
#   array
# end
#
# def our_select(array)
#   new_array = []
#   array.each do |el|
#     next unless yield(el)
#     new_array << el
#   end
#   new_array
# end

def our_reduce(array, result = array.shift)
  array << "test"                            # => ["moose", "bear", "cat", "dog", "test"]
  array.each do |el|                         # => ["moose", "bear", "cat", "dog", "test"]
    result = yield(result, el)               # => 5, 9, 12, 15, 19
  end                                        # => ["moose", "bear", "cat", "dog", "test"]
  result                                     # => 19
end                                          # => :our_reduce


# our_map(array) { |el| el.length }
# our_each(array) { |el| puts el.length }
# our_select(array) { |el| el.length < 4 }
our_reduce(array, 0 ) { |acc, el| acc + el.length }  # => 19
p array.object_id                                    # => 70276436266040
array                                                # => ["moose", "bear", "cat", "dog", "test"]

# >> 70276436266040
