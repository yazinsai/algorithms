=begin
You are given a read only array of n integers from 1 to n. Each 
integer appears exactly once except A which appears twice and B 
which is missing.

Return A and B.

Note: Your algorithm should have a linear runtime complexity. 
Could you implement it without using extra memory?

Note that in your output A should precede B.

https://www.interviewbit.com/problems/repeat-and-missing-number-array/
=end

require 'set'

def find(arr)
  # O(n) time
  arr.sort!
  prev = nil
  
  a = nil # repeated number
  b = nil # missing number
  arr.length.times do |i|
    (prev = arr[i]; next) if prev.nil?
    
    a = arr[i] if arr[i] == prev
    b = prev + 1 if arr[i] - prev > 0
    prev = arr[i]
  end
  [a, b]
end

puts find([3, 1, 2, 5, 3]).inspect
