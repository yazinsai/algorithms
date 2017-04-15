def get_bit(num, i)
  num & (1 << i) != 0
end

def set_bit(num, i)
  num | (1 << i)
end

def clear_bit(num, i)
  # 10111, 2 => 10011
  num & ~(1 << i)
end

def clear_bit_msb_through_i(num, i)
  # 10110111, 2 => 0000011
  # 00000111 <-- mask
  # 11111000
  num & ~(~0 << i)
end

puts clear_bit_msb_through_i(32, 1)
