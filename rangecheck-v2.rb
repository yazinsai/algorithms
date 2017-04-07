# Improved algorithm for detecting overlaps in two timelines
# Operates in O(n) time, O(1) space

def overlap?(a, b)
  # Sort both arrays, by start time
  a.sort!
  b.sort!

  # Iterate
  while !a.empty? && !b.empty? do
    return true if range_overlap?(a[0], b[0])

    # remove the earlier element
    a[0][0] < b[0][0] ? a.shift : b.shift
  end

  # No clash
  return false
end

def range_overlap?(a, b)
  !(a.first > b.last || a.last < b.first)
end

a = [[660, 710], [720, 820], [500, 520], [3360, 3410]] # PHYCS/X
b = [[400, 490], [6240, 6290]] # MATHS101/1

puts overlap?(a, b).inspect
