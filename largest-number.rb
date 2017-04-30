=begin
Given a list of non negative integers, arrange them such that they 
form the largest number.

For example:

Given [3, 30, 34, 5, 9], the largest formed number is 9534330.

Note: The result may be very large, so you need to return a string
instead of an integer.

Source: https://www.interviewbit.com/problems/largest-number/
=end

def largest_number(arr)
  special_sort = ->(a, b) { "#{b}#{a}".to_i <=> "#{a}#{b}".to_i }
  result = arr.sort(&special_sort).join("")
  
  result.sub!(/^0+/, "") # strip leading zeros
  result.empty? ? "0" : result
end

puts largest_number([3, 30, 34, 5, 9])
