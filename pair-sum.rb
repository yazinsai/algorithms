=begin
Given an unsorted array of integers, find a pair with given sum in it.

For example,
Input:
arr = [8, 7, 2, 5, 3, 1]
sum = 10

Output: 
Pair found at index 0 and 2 (8 + 2)
OR
Pair found at index 1 and 4 (7 + 3)
=end

def pair_sum(nums, sum)
  # naive approach would be to generate all 2-pair subarrays, then check
  # them all for the sum. This would take O(n2) time
  
  # we can do better. if we track the required "complement" for each 
  # number (in a hash with constant lookup time) as we iterate the 
  # array, we can achieve O(n) time -- which is as good as it gets.
  
  complements = {}
  nums.length.times do |i|
    # have we seen this number's complement before
    if complements.include? nums[i]
      return [ complements[ nums[i] ], i ] # return indexes
    end
    
    complements[ sum - nums[i] ] = i
  end
  false
end

puts pair_sum([8, 7, 2, 5, 3, 1], 10).inspect
