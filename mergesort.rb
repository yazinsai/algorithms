# Elementary version of mergesort, with following limitations:
# - input array must have 2^n elements (so we have an even split down to 2 elements)
#
# mergesort is *awesome* because it is linear O(nlogn)

def mergesort(a)
  # base case
  return a if a.length == 1

  # divide and conquer (and merge)
  mid = a.length / 2 - 1
  merge( mergesort(a[0..mid]), mergesort(a[mid+1..-1]) )
end

def merge(a, b)
  half_index = a.length - 1
  full_index = a.length + b.length - 1

  j = k = 0
  c = []

  for i in 0..full_index
    # finished with any of the halves?
    return c += b[k..-1] if j > half_index 
    return c += a[j..-1] if k > half_index

    # compare as normal
    if a[j] <= b[k]
      c[i] = a[j]; j+=1
    else
      c[i] = b[k]; k+=1
    end
  end
end

# try it out
puts mergesort([ 4,  0,  9, 5, 2,  1, 3,  8, 
                -1, 10, -5, 3, 1, 99, 0, -1, -9]).inspect
