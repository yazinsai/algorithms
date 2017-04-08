=begin
Given an array of non-negative integers, you are initially positioned at the
first index of the array.

Each element in the array represents your maximum jump length at that position.

Determine if you are able to reach the last index.

For example:
A = [2,3,1,1,4], return true.
A = [3,2,1,0,4], return false.

Source: https://leetcode.com/problems/jump-game/#/description
=end

def can_jump(nums)
  # a. Start from the right
  # b. Compute end-jump digits for each index except the last
  # c. Any index that points to an OK index is fine. Others are immediately
  #    excluded
  #
  # Should be able to implement in O(n) time, O(n) space. An alternative is 
  # to implement recursive solution, using Dynamic Programming
  len = nums.length
  
  can_jump = Array.new(len, false)
  can_jump[-1] = true
  for i in (len - 1).downto(0)
    for j in 1..[nums[i], len].min
      can_jump[i] ||= can_jump[i + j]
      break if can_jump[i]
    end
  end
  
  can_jump[0]
end

puts can_jump([3, 2, 1, 0, 4]).inspect
