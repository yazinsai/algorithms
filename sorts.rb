# - O(n2) time
# + O(1) space
def bubble_sort(a)
  for i in 0...a.length-1
    for j in 0...a.length-i-1
      a[j], a[j+1] = a[j+1], a[j] if a[j] > a[j+1] # swap
    end
  end
  a
end

# - O(n2) time
# + O(1) space
def selection_sort(a)
  for i in 0...a.length
    min_index = i
    for j in i...a.length
      min_index = j if a[j] < a[min_index]
    end
    a[i], a[min_index] = a[min_index], a[i] # swap
  end
  a
end

# + O(nlogn) time
def merge_sort(a)
  if a.length == 1 # base case
    return a
  else
    mid = a.length / 2
    merge( merge_sort(a[0, mid]) , merge_sort(a[mid..-1]) )
  end
end
def merge(left, right)
  sorted = []
  while !left.empty? && !right.empty?
    sorted << (((left[0] <=> right[0]) == -1) ? left.shift : right.shift)
  end
  sorted += (left.empty? ? right : left)
end

def radix_sort(a)
  # doesn't handle -ve's!
  for base in 0...6 # max element < 10^6
    digits = Array.new(10, [])
    for i in 0...a.length
      digit = (a[i] / 10**base) % 10
      digits[digit] += [ a[i] ]
    end
    a = digits.flatten
  end
  a
end

puts radix_sort([4012, 103, 91017, 05, -1, 19]).inspect
