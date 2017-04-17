# Given an array of ints, is it possible to choose a group of 
# some of the ints, such that the group sums to the given target?
def group_sum(nums, target)
  sum = group_sum_helper(nums, target)
  sum == target
end
def group_sum_helper(nums, target)
  return 0 if nums.length == 0
  sum = group_sum_helper(nums[1..-1], target) # top down
  sum + nums[0] <= target ? sum + nums[0] : sum # bottom up
end
puts group_sum([2, 4, 8], 9)
