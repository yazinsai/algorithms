=begin
Given a string s, partition s such that every substring of the 
partition is a palindrome.

Return all possible palindrome partitioning of s.

For example, given s = "aab",
Return
[
  ["aa","b"],
  ["a","a","b"]
]
https://leetcode.com/problems/palindrome-partitioning
=end

# Implements solution using memoization (with cache{})
# Without memoization, time is O(n3) --> 
#   O(n2) for iteration, O(n) for palindrome check
# With memoization, time is O(n2) -->
#   O(n) for iteration, O(n) for palindrome check
def partition(word, cache={})
  return [[]] if word.empty?
  return [[word]] if (len = word.length) < 2
  
  words = []
  len.times do |i|
    if palindrome?(prefix = word[0..i])
      suffix = word[i+1..-1]
      cache[suffix] = partition(suffix, cache) if !cache.include?(suffix)
      if !cache[suffix].nil?
        # apply prefix to each resulting suffix-palindrome
        cache[suffix].each do |suffix_pal|
          words << [prefix] + suffix_pal
        end
      end
    end
  end
  
  words.empty? ? nil : words
end

def palindrome?(word)
  len = word.length
  return true if len < 2
  
  for i in 0...len/2
    return false unless word[i] == word[len-i-1]
  end
  
  true
end

puts partition("aab").inspect
