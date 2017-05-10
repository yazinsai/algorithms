# Given an array of ints, is it possible to choose a group of
# some of the ints, such that the group sums to the given target?

# Solution in O(2^n) -- yup, it's exponential and I don't see how
# we can do better honestly :/
def group_sum(arr, target)
  return true if target == 0
  return false if target < 0 || arr.empty?
  
  # for each element, you can either choose to take it or not
  return true if include = group_sum(arr[1..-1], target - arr[0])
  return true if exclude = group_sum(arr[1..-1], target)
  false
  
  # you could also do:
  #   include = group_sum(...
  #   exclude = group_sum(...
  #   include || exclude
  # but the current solution performs better (it exits as soon 
  # as it finds a 'true', whereas the other just keeps going)
end

puts group_sum([2, 4, 8], 10)
