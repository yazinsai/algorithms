=begin
Given a collection of intervals, merge all overlapping intervals.

For example:
Given [1,3],[2,6],[8,10],[15,18],
return [1,6],[8,10],[15,18].

Make sure the returned intervals are sorted.

From https://www.interviewbit.com/problems/merge-overlapping-intervals/
=end

def merge(arr)
  arr.sort!
  
  merged = []
  arr.length.times do |i|
    if merged.empty? || merged[-1][1] < arr[i][0]
      # gap between last slot and this one; can't merge
      merged << arr[i]
    else
      # update range-end, if it's further out
      new_end = arr[i][1]
      merged[-1][1] = new_end if new_end > merged[-1][1]
    end
  end
  
  merged
end

def merge_insert(arr, add)
	merge(arr << add)
end

puts merge([[1,3],[2,6],[8,10],[15,18]]).inspect
puts merge_insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,9]).inspect
