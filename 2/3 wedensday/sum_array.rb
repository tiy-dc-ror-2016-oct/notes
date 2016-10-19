def sum_arrays(array)
  total = 0
  array.each do |el|
    # Sum sub arrays
    if el.is_a?(Array)
      total += sum_arrays(el)
    end

    # Skip over nils
    next if el == nil

    # Add up 1-d elements
    total += el
  end
  total
end

sum_arrays([1,2,3])
sum_arrays([1,2,3, nil])
sum_arrays([1, 2, 3, 55, [-1], [234, 234, 123, [1234]]])
