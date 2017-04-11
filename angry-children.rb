# Source: https://www.hackerrank.com/challenges/angry-children

def max_min(nums, k)
  return if k > nums.length

  # pick k from nums, such that we minimize range
  nums.sort!
  min = nums[k - 1] - nums[0] # first k elements
  for i in 0..(nums.length - k)
    range = nums[i + k - 1] - nums[i]
    min = range if range < min
  end

  min
end

puts max_min([100, 200, 300, 350, 400, 401, 402], 3)
