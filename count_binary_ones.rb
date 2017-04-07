def count_binary_ones(n)
  b = n.to_s(2)
  
  ones = 0
  while !b.empty? do
    ones += 1 if b[-1] == "1"
    b.chop!
  end
  
  ones
end

puts count_binary_ones(7)
