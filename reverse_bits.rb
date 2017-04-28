LEN = 32 # bits

def reverse_bits(num)
  return if num >= 2**32
  
  num_b = num.to_s(2)
  num_b = "0" * (LEN - num_b.length) + num_b # pad 0's
  
  num_b.reverse.to_i(2)
end

puts reverse_bits(43261596)
