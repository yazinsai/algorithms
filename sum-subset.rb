=begin
Subset sum problem
Given a set of positive integers and an integer s, is there any 
non-empty subset whose sum to s.

For example,

Input:   
set = { 7, 3, 2, 5, 8 }
sum = 14

Output: Yes
subset { 7, 2, 5 } sums to 14
=end

def sum(nums, sum)
  return true if  sum == 0
  return false if nums.empty?
  
  include = sum(nums[1..-1], sum - nums[0])
  exclude = sum(nums[1..-1], sum)
  
  return true if include || exclude # hits sum == 0
  false
end

puts sum([7, 3, 2, 5, 8], 14).inspect
