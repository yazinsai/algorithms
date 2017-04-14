=begin
Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
=end

require 'set'

def is_unique(string)
  unique_chars = string.chars.to_set

  return false if unique_chars.length < string.length
  true
end

def is_unique_raw(string)
  # This method doesn't use a data structure
  return false if string.chars.uniq.length < string.length
  true
end

puts is_unique("hitreae")
puts is_unique_raw("helo")
