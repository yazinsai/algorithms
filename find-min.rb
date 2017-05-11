=begin
Suppose an array sorted in ascending order is rotated at some pivot 
unknown to you beforehand.
(i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).

Find the minimum element. The array may contain duplicates.

https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
=end

def find_min(arr)
  lo, hi = 0, arr.length - 1
  
  while lo < hi do
    mid = lo + (hi - lo) / 2
    
    case arr[mid] <=> arr[hi]
    when -1 # sorted normally, search left
      hi = mid
    when  1 # "resets" somewhere on the right
      lo = mid + 1
    when  0 # min could be on either side, just remove an element
      hi -= 1
    end
  end
  
  arr[lo]
end

puts find_min([4,5,1,2,2])
