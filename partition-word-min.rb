=begin
Given a string s, partition s such that every substring of the 
partition is a palindrome.

Return the minimum cuts needed for a palindrome partitioning of s.

For example, given s = "aab",
Return 1 since the palindrome partitioning ["aa","b"] could be 
produced using 1 cut.

Source: https://leetcode.com/problems/palindrome-partitioning-ii/
=end

def partition(word, cache = {})
  return 0 if (len = word.length) < 2 || palindrome?(word)
  
  min = []
  for i in (len-1).downto(0)
    if palindrome?(prefix = word[0..i])
      suffix = word[i+1..-1]
      cache[suffix] = partition(suffix, cache) if !cache.include? suffix
      min << cache[suffix] + (suffix.empty? ? 0 : 1)
    end
  end
  min.min
end

def palindrome?(word)
  half = (len = word.length) / 2
  half.times do |i|
    return false if word[i] != word[len - i - 1]
  end
  true
end

puts partition("a").inspect
