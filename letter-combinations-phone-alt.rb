=begin
Given a digit string, return all possible letter combinations that 
the number could represent. A mapping of digit to letters (just like 
on the telephone buttons) is given below.

Input:Digit string "23"
Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

https://leetcode.com/problems/letter-combinations-of-a-phone-number/
=end

def letter_combinations(digits)
  digits.chars.each_with_object([]) do |d, queue|
    chars = i_to_c(d)
    next if chars.empty?
    
    if queue.empty? # we'll just add the chars
      queue.push *chars
    else
      queue.length.times do
        elem = queue.shift
        # append each of the chars[] to each element and append
        # it to the back of the queue
        chars.each {|c| queue << elem + c }
      end
    end
  end
end

def i_to_c(digit)
  digit = digit.to_i
  return [] if digit < 2
  
  map = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
  map[digit - 2].split("")
end

puts letter_combinations("22").inspect
