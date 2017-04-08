=begin
Implement strStr().

Returns the index of the first occurrence of needle in haystack, or -1 if 
needle is not part of haystack.

Source: https://leetcode.com/problems/implement-strstr/#/description
=end

def str_str(haystack, needle)
  return 0 if haystack == needle
  
  i = 0
  while i < haystack.length do
    j = 0
    while j < needle.length
      break if haystack[i+j] != needle[j]
      j += 1
    end
    return i if j == needle.length
    
    i += 1 # not j, because "mississippi", "issip"
  end
  -1
end

puts str_str("haystack", "stack")
