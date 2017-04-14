=begin
Given two strings, write a method to decide if one is a permutation of the other.
=end

def is_permutation(s1, s2)
  # String permutations share the same characters, and the same freq of
  # characters.
  return true if s1 == s2
  return false if s1.length != s2.length 

  # find char frequencies
  h1 = Hash.new 0; h2 = Hash.new 0
  s1.chars.each {|c| h1[c] += 1}
  s2.chars.each {|c| h2[c] += 1}

  # cross check
  return false if h1.keys.size != h2.keys.size
  h1.all? {|k, v| h2[k] == v}
end

puts is_permutation("hithere","tereihh")
