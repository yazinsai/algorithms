=begin
Given an array where elements are sorted in ascending order, convert it to a
height balanced BST.

Source: http://bit.ly/2ocANpv
=end

class Node
  attr_accessor :val, :left, :right

  def initialize(val, left=nil, right=nil)
    @val = val
    @left, @right = left, right
  end
  
  def to_s()
    "#{val}:\n" \
    "L=#{left.to_s if left}\n"\
    "R=#{right.to_s if right}"
  end
end

def array_to_bst(array)
  return if !array || array.length == 0
  
  if array.length == 1
    Node.new(array[0])
  else
    mid = array.length / 2
    Node.new( 
      array[mid], 
      array_to_bst( array[0, mid] ), 
      array_to_bst( array[mid+1, array.length-1] ))
  end
end

n = array_to_bst([1, 3])
puts n.to_s

