# Source: https://leetcode.com/problems/merge-sorted-array/

def merge (a, b)
  # merge b into a
  pointer = 0
  while pointer < a.length do
    break if b.empty?
    
    if b[0] < a[pointer]
      a.insert(pointer, b.shift)
    else
      pointer += 1
    end
  end
  
  a + b # whatever is left of b
end

puts merge([1, 2, 9, 15], [2, 3, 5, 9, 24]).inspect
