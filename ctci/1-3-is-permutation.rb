=begin
Given two strings, write a method to decide if one is a permutation of the other.
=end

def is_permutation(s1, s2)
  # must be same length
  return false if s1.length != s2.length

  # use hashes for storing char frequencies
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  
  # populate char frequencies
  s1.chars.each {|v| h1[v] += 1}
  s2.chars.each {|v| h2[v] += 1}
  
  # iterate through characters
  h1.each do |k,v|
    return false unless v == h2[k]
  end
  
  true
end

puts is_permutation("hithere","thereih")
