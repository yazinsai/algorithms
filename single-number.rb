=begin
Given an array of integers, every element appears twice except for one.
Find that single one.

Note:
Your algorithm should have a linear runtime complexity. Could you 
implement it without using extra memory?

Source: https://leetcode.com/problems/single-number/
=end
require 'set'

# Uses O(n) time, O(n) space
def single_number(nums)
  return nums[0] if nums.length < 2
  
  seen_once = Set.new
  nums.length.times do |i|
    seen_once.include?(nums[i]) ? 
      seen_once.delete(nums[i]) : seen_once << nums[i]
  end
  
  raise ArgumentError, "Invalid input" if seen_once.empty?
  seen_once.to_a.first
end

# Uses O(n) time, O(1) space
def single_number_genius(nums)
  # Just XOR all elements -- gets rid of all redundancies
  nums.inject(&:^)
end

puts single_number_genius([1, 1, 2, 3, 2]).inspect
