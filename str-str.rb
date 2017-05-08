=begin
Implement strStr().

Returns the index of the first occurrence of needle in haystack, or -1 if 
needle is not part of haystack.

Source: https://leetcode.com/problems/implement-strstr/#/description
=end

# searches for needle in haystack
def strstr(haystack, needle)
  i = 0
  while i < haystack.length do
    if haystack[i] == needle[0]
      found = true
      needle.length.times do |j|
        if haystack[i + j] != needle[j]
          found = false
          break
        end
      end
      return i if found
    end
    
    i += 1
  end
  
  false
end

puts strstr("mississippi", "issip")
