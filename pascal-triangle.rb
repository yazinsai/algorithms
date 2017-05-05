=begin
Given numRows, generate the first numRows of Pascal’s triangle.
Pascal’s triangle : To generate A[C] in row R, sum up A’[C] and 
A’[C-1] from previous row R - 1.

Example:

Given numRows = 5,
Return
[
     [1],
     [1,1],
     [1,2,1],
     [1,3,3,1],
     [1,4,6,4,1]
]
=end

def generate(n)
  return [] if n == 0
  pascal = [[1]]
  
  for i in 1...n
    row = []
    for j in 0..i
      row << (j < i ? pascal[i - 1][j] : 0) +
              (j - 1 >= 0 ? pascal[i - 1][j - 1] : 0)
    end
    pascal << row
  end
  
  pascal
end

puts generate(1).inspect
