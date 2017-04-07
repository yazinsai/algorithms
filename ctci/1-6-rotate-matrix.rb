=begin
Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?
=end
require 'matrix'

# allow direct modification of matrices
class Matrix
  public :"[]=", :set_element, :set_component
end

def rotate(m)
  # can't rotate non-square matrices
  return false if m.column_size != m.row_size
  n = m.column_size
  
  for layer in 0..n/2
    first = layer
    last = n - 1 - layer
    
    for i in first..last-1
      offset = i - first
      top = m[first, layer + offset]
  
      # left -> top
      m[first, layer + offset] = m[last - offset, first]
      
      # bottom -> left
      m[last - offset, first] = m[last, last - offset]
      
      # right -> bottom
      m[last, last - offset] = m[first + offset, last]
      
      # top -> right
      m[first + offset, last] = top
    end
  end
  
  m
end

m = Matrix.diagonal(1, 2, 3, 4, 5)
puts "Matrix before:\n #{m.inspect}"
m = rotate(m)
puts "Matrix after:\n #{m.inspect}"
