# Source: https://community.topcoder.com/stat?c=problem_statement&pm=1259&rd=4493

# 0. Initial brute force approach O(n^3)
def zigzag_brute(array)
  # returns longest subsequence of +/- numbers in the array
  # limitation: doesn't work on non-contiguous subsequences
  max = 0
  len = array.length
  len.times do |i|
    for j in i...len
      max = [max, j - i + 1].max if zigzag?(array[i..j])
    end
  end
  max
end

def zigzag?(array)
  return true if array.length < 3
  
  sign = nil
  for i in 1...array.length
    diff = (array[i] - array[i-1]) <=> 0 # 1 for +ve, -1 for -ve
    return false if sign && (diff - sign).abs != 2
    
    sign = diff
  end
  true
end

# 1. Better
def zigzag(array)
  return array.length if array.length <= 1
  
  # generate the differences
  diffs = []
  (1...array.length).each do |i|
    diffs << array[i] - array[i - 1]
  end
  puts diffs.inspect
  
  # find first non-zero element
  start = diffs.index {|e| !e.zero? }
  dir = diffs[start] <=> 0
  length = 2
  
  # iterate
  (start+1...diffs.length).each do |i|
    if diffs[i] * dir < 0
      dir *= -1
      length += 1
    end
  end
  
  length
end

puts zigzag([1, 4, 2, 3, 3, 4])
