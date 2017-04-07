# Run this file and make the assertions work!

def assert(expected)
  actual = yield

  if expected == actual
    print "."
  else
    raise "#{actual.inspect} was not #{expected.inspect}"
  end
end

# VERY EASY

# Return the last element of an array
def last(array)
  array[-1]
end

# Return the last two elements of an array
def last_two(array)
  array.last(2)
end

# Return the element at position i
def at(array, i)
  array[i]
end

# Return the length of an array without using Array#size
def length(array)
  array.rindex(array[-1]) + 1
end


# EASY

# Reverse the array without using Array#reverse
def rev(a)
  for i in 0...a.length/2
    a[i], a[-i-1] = a[-i-1], a[i]
  end
  a
end

# Check if an array is a palindrome
def palindrome?(array)
  for i in 0...array.length/2
    return false if array[i] != array[-i-1]
  end
  true
end


# MEDIUM

# Flatten an array without using Array#flatten
def flatten(a, flat=[])
  if a.class != Array
    # base case
    flat << a
  else
    a.each {|v| flatten(v, flat)}
  end
  flat
end

# Eliminate consecutive duplicates of list elements.
def compress(array)
  prev = nil
  array.select {|v| v == prev ? false : prev = v}
end


# HARD

# Pack consecutive duplicates into subarrays without using Array#group_by.
def pack(a)
	reps = Hash.new(1)
  prev = nil
  
  # filter out repeats
  a.select! {|v| prev == v ? (reps[v] += 1; false) : prev = v}
  
  # replace with nested arrays
  reps.each {|k, v| a[a.index k] = Array.new(v, k)}
  
  a
end


assert(4)     { last [1,2,3,4] }
assert([3,4]) { last_two [1,2,3,4] }
assert(2)     { at [1,2,3,4], 1 }
assert(4)     { length [1,2,3,4] }

assert([3,2,1]) { rev [1,2,3] }
assert(true)    { palindrome? [1,2,3,2,1] }

assert([1,2,3,4,5]) { flatten [1,[2,3],[4,[5]]] }
assert([1,2,3,4,5]) { compress [1,1,2,3,3,3,4,5] }


assert([[1,1], 2, [3,3,3], 4, 5]) { pack [1,1,2,3,3,3,4,5] }
