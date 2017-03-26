# Ruby implementation of mergesort. mergesort is *awesome* because it is linear O(nlogn)

def mergesort(a)
  # base case
  return a if a.length == 1

  # divide and conquer (and merge)
  mid = a.length / 2 - 1
  merge( mergesort(a[0..mid]), mergesort(a[mid+1..-1]) )
end

def merge(a, b)
  j = k = 0
  c = []
  index = a.length + b.length - 1

  for i in 0..index
    # finished with any of the halves?
    return c += b[k..-1] if j > a.length - 1 
    return c += a[j..-1] if k > b.length - 1

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
                -1, 10, -5, 3, 6, 99, 0, -2, -9]).inspect
