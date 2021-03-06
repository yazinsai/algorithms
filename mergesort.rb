# Ruby implementation of mergesort. mergesort is *awesome* because it is linear O(nlogn)

def mergesort(a)
  # base case
  return a if a.length == 1

  # divide and conquer (and merge)
  mid = a.length / 2
  merge( mergesort(a[0, mid]), mergesort(a[mid, a.length]) )
end

def merge(a, b)
  puts "merge called with a = #{a.inspect}, b = #{b.inspect}"
  j = k = 0
  c = []
  max_index = a.length + b.length - 1

  for i in 0..max_index
    # fast forward if we've finished traversing either 'a' or 'b'
    return c += b[k..-1] if j > a.length - 1 
    return c += a[j..-1] if k > b.length - 1

    # append the smallest element to 'c'
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
