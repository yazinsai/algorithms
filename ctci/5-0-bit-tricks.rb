def getBit(num, bit)
  # right-most bit = 0
  num & (1 << bit) != 0
end

def setBit(num, bit)
  num | (1 << bit)
end

def clearBit(num, bit)
  mask = ~(1 << bit)
  num & mask
end

def clearLeftToBit(num, bit)
  mask = (1 << bit) - 1 # 0000 0111 (when bit = 2)
  num & mask
end

def clearRightToBit(num, bit)
  mask = ~((1 << bit) - 1)
  num & mask
end

puts clearRightToBit(5, 2)
