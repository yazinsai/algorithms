# Source: https://www.hackerrank.com/challenges/bear-and-steady-gene

GENES = "ACGT"

def steady(str)
  len = str.length
  n = len / 4
  
  # calculate character frequencies
  freqs = Hash.new(0)
  str.length.times {|i| freqs[ str[i] ] += 1}
  
  # sliding windows
  min = Float::INFINITY
  left = right = 0
  while left < len && right < len do
    if !balanced?(n, freqs)
      freqs[ str[right] ] -= 1
      right += 1
    else
      min = [min, right - left].min
      freqs[ str[left] ] += 1
      left += 1
    end
  end
  
  min
end

def balanced?(n, freqs)
  freqs.all? {|k, v| v <= n}
end

puts steady("GAAATAAA") # => 5
