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

def to_bst(arr)
  return nil if arr.nil? || arr.empty?
  
  mid = arr.length / 2
  Node.new(arr[mid],
    to_bst(arr[0...mid]),
    to_bst(arr[mid+1..-1]))
end

puts to_bst([1, 2, 4, 5, 7, 9]).to_s
