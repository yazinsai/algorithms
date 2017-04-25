# Source: https://leetcode.com/problems/permutations-ii/ 
=begin
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

For example,
[1,1,2] have the following unique permutations:
[
  [1,1,2],
  [1,2,1],
  [2,1,1]
]
=end
require 'set'

def permute(nums)
  # this set of numbers contains duplicates, and we're asked to
  # find the set of unique permutations.
  # using combinatoris, we know the number of unique combinations is
  # n! / k! (where k = # of duplicates)
  nums[1..-1].each_with_object(Set.new << [nums.first]) do |n, perms|
    tmp = Set.new
    perms.each do |perm|
      for j in 0..perm.length
        # insert in each possible position
        tmp << perm.dup.insert(j, n)
      end
    end
    perms.replace(tmp)
  end.to_a
end

puts permute([1, 1, 3]).inspect
