# Source: https://leetcode.com/problems/permutations 

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  # iterative solution
  nums[1..-1].each_with_object([[ nums[0] ]]) do |c, perms|
    perms.length.times do |i|
      perm = perms.shift
      for j in 0..perm.length
        perms << perm.dup.insert(j, c)
      end
    end
  end
end
