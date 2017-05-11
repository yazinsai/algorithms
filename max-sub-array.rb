=begin
Find the contiguous subarray within an array (containing at least 
one number) which has the largest sum.

For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
the contiguous subarray [4,-1,2,1] has the largest sum = 6.

Source: https://leetcode.com/problems/maximum-subarray/
=end
def max_sub_array(arr)
  pre = cur = arr[0]
  for i in 1...arr.length
    # should we continue our streak, or restart here?
    pre = [pre + arr[i], arr[i]].max
    
    # track the highest pre_max we've seen so far
    cur = [pre, cur].max # global max of all pre's
  end
  
  cur # return the global max
end

puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4])
