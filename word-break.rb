=begin
Given a non-empty string s and a dictionary wordDict containing a list
of non-empty words, determine if s can be segmented into a space-
separated sequence of one or more dictionary words. You may assume 
the dictionary does not contain duplicate words.

For example, given
s = "leetcode",
dict = ["leet", "code"].
Return true because "leetcode" can be segmented as "leet code".

Source: https://leetcode.com/problems/word-break/
=end

# Assuming the word can only be broken down into two words
def word_break_two(word, dict)
  word.length.times do |i|
    prefix = word[0..i]
    suffix = word[i+1..-1]
    return "#{prefix} #{suffix}" if 
      dict.include?(prefix) && dict.include?(suffix)
  end
  
  nil
end

# Uses recursive backtracking to solve the problem
$cache = Hash.new
def word_break(word, dict)
  return true if dict.include? word
  return $cache[word] if $cache.include? word
  
  word.length.times do |i|
    prefix = word[0..i]
    if dict.include? prefix
      suffix = word[i+1..-1]
      if !$cache.include? suffix
        $cache[suffix] = word_break(suffix, dict)
      end
      return true if true == $cache[suffix]
    end
  end
  
  $cache[word] = false
end

# Using a stack instead of recursion
def word_break(word, dict)
  stack = [word]
  while stack.any? do
    puts "stack=#{stack.inspect}"    
    current = stack.pop
    current.length.times do |i|
      prefix = current[0..i]
      if dict.include? prefix
        suffix = current[i+1..-1]
        suffix.empty? ? 
          return true : # all words exist in dict
          stack.push suffix # iterate into suffix
        end
      end
    end
  end
  false # no match
end


puts word_break("aaaaaaa", ["aaaa", "aaa"])
