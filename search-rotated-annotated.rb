# You're given a sorted array that has been rotated. Write a method
# that searches for a particular number. Optimize for performance

# This solution uses a variant of binary search, which operates in
# O(n) = log(n) time. It's as good as it gets.
# P.S: Watch out for edge cases! They're a real mind-bender

def search_rotated(arr, n) # find n in arr[]
  # There are two possible situations
  #   arr = [0, 1, 2, 3, 4, 5] <-- it's rotated to in order
  #   arr = [3, 4, 5, 0, 1, 2] <-- it's rotated out of order
  # In binary search, it's enough to just check the middle element
  # to determine which half we'll find our search term in. Here,
  # we'll have to do a bit more work -- we'll check which of the 
  # situations we're in before deciding.
  return false if arr.nil? || arr.empty?
  
  mid = arr.length / 2
  if arr[mid] == n # easy
    return true
  else # let's pick a side
    left, right = 0, -1
    if arr[right] > arr[mid] # elements to our right are in-order
      if n > arr[mid] && n <= arr[right] # search right half
        search_rotated(arr[mid+1..right], n)
      else # left
        search_rotated(arr[left..mid-1], n)
      end
    else # elements to the right are not ordered. But, the left are
      if n >= arr[left] && n < arr[mid] # search left half
        search_rotated(arr[left..mid-1], n)
      else # right
        search_rotated(arr[mid+1..right], n)
      end
    end 
  end
end

puts search_rotated([2, 3, 4, 5, 0, 1], 2)
