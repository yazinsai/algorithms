# You're given a sorted array that has been rotated. Write a method
# that searches for a particular number. Optimize for performance

# This solution uses a variant of binary search, which operates in 
# O(n) = log(n) time. It's as good as it gets.
# P.S: Watch out for edge cases! They're a real mind-bender
def search(a, x) # search for x in a[]
  puts "Called search(#{a.inspect}, #{x})"
  return false if a.length == 0

  mid = a.length / 2
  left, right = 0, -1
  if a[mid] == x
    true
  elsif a[mid] <= a[right] # sorted, between mid -> right
    if x > a[mid] && x <= a[right]
      search(a.right, x)
    else
      search(a.left, x)
    end
  else # resets after middle
    if x > a[mid] || x <= a[right]
      search(a.right, x)
    else
      search(a.left, x)
    end
  end
end

class Array
  def left # left half of array, excl. mid
    self[0...(self.length/2)]
  end
  def right # right half of array, excl. mid
    self[(self.length/2 + 1)..-1]
  end
end

def search_iterative(a, x)
  left, right = 0, a.length - 1
  while left <= right do
    mid = (left + right) / 2
    if a[mid] == x; return true; end
    if a[mid] < a[right] # sorted
      if x > a[mid] # search right
        left = mid + 1
      else # search left
        right = mid - 1
      end
    else # resets in right side
      if x > a[mid] || x <= a[right] # search right
        left = mid + 1
      else # search left
        right = mid - 1
      end
    end
  end
  false
end

puts search([3, 4, 5, 6, 1, 2], 3).inspect
puts search_iterative([3, 4, 5, 6, 1, 2], 3).inspect
