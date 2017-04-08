=begin
A message containing letters from A-Z is being encoded to numbers using the following mapping:

'A' -> 1
'B' -> 2
...
'Z' -> 26
Given an encoded message containing digits, determine the total number of ways to decode it.

For example,
Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

The number of ways decoding "12" is 2.

Source: https://leetcode.com/problems/decode-ways/#/description

Commentary:

This has all the signs of a recursive solution. For every character, we need to
peek ahead and look at the next one. If we find that it fits the range of the
character encoding (i.e. < 26) then we'll make two recursive calls, one for the
first option (e.g. "1") and another for the second (e.g. "12"). This is bad
performance wise -- basically O(2^n) complexity.

Is there a better way? We're not asked to find the options, just calculate how
many there are -- so that is a sign. We could just multiply the number of options per "set" of characters and we'd get the total.

Example: 1234

First block: "12" < 26. There are 2 options: 1,2 = "AB" and 12 = "L"
Next block:  "3" < 26 (34 is not). 1 option
Next block:  "4" < 26. 1 option

Total options = 2 x 1 x 1 = 2 (the options are ABCD and LCD)

This would not require recursion, and it would perform alot better, since it's
O(n) complexity. Eureka!

Update: Wait a sec. Let's take another example, say 112

First block: "11" < 26. There are 2 options: 1, 1 = "AA" and 11 = "K"
Next block: "2" .. wait! What if the first option was a "1" (i.e. "A") and 
the next was "12" = "L" (i.e. 112 = "AL"). This is an option we're not currently
accounting for by skipping the block. 
=end

def decode_ways(msg)
  return 0 if msg.empty?
  
  prev = nil
  ways = 0
  
  while !msg.empty? do    
    if prev && (prev + msg[0]).to_i <= 26
      ways += 1 unless msg[0] == "0"
    end
    
    ways = [1, ways].max if (1..9).include? msg[0]
    
    prev = msg[0]
    msg[0] = ''
  end
  
  ways
end

puts decode_ways("10")
