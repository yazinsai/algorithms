=begin
Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
=end

require 'set'

def is_unique(string)
  unique_chars = string.chars.to_set
  return false if unique_chars.length < string.length
  
  return true
end

puts is_unique("hitreae")
