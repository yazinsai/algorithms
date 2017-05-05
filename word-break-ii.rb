=begin
Given a non-empty string s and a dictionary wordDict containing a list
of non-empty words, add spaces in s to construct a sentence where each 
word is a valid dictionary word. You may assume the dictionary does 
not contain duplicate words. Return all such possible sentences.

For example, given
s = "catsanddog",
dict = ["cat", "cats", "and", "sand", "dog"].
A solution is ["cats and dog", "cat sand dog"].

https://leetcode.com/problems/word-break-ii/#/description
=end

$result = []

def word_break(source, dict, chain = "")
  # base case
  if dict.include? source
    $result << "#{chain}#{source}"
    return source
  end
  
  source.length.times do |i|
    prefix = source[0..i]
    if dict.include? prefix
      suffix = source[i+1..-1]
      word_break(suffix, dict, "#{chain}#{prefix} ")
    end
  end
  
  $result
end

puts word_break("catsanddog", 
                ["cat", "cats", "and", "sand", "dog"]).inspect
