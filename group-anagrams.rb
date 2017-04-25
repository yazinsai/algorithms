=begin
Group anagrams
Given an array of strings, group anagrams together.

For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"], 
Return:
[
  ["ate", "eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note: All inputs will be in lower-case.
Source: https://leetcode.com/problems/anagrams/
=end

def group_anagrams(arr)
  anagrams = Hash.new # hash with key of sorted characters
  arr.length.times do |i|
    str = arr[i]
    str = str.chars.sort.join("")
    if anagrams.include? str
      anagrams[str] << arr[i]
    else
      anagrams[str] = [arr[i]]
    end
  end
  anagrams.each_with_object([]) {|(k, v), obj| obj << [v].flatten }
end

def group_anagrams_v2(arr)
  arr.group_by {|str| str.chars.sort }.values
end

puts group_anagrams(
      ["eat", "tea", "tan", "ate", "nat", "bat"]).inspect
