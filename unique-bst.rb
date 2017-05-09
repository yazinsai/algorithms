=begin
Unique Binary Search Trees II
Difficulty:Medium

Given an integer n, generate all structurally unique BST's (binary 
search trees) that store values 1...n.

For example,
Given n = 3, your program should return all 5 unique BST's shown below.

   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
=end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
  
  def to_s
    "#{@val}, l=<#{@left.to_s if @left}> r = <#{@right.to_s if @right}>"
  end
end

def generate_trees(n)
  trees_helper([*1..n])
end

def trees_helper(arr)
  return [nil] if arr.nil? || arr.empty?
  return arr if arr.length == 1
  
  combined = []
  # different root (or pivot point) with each loop
  for i in (arr.length-1).downto(0)
    # construct left / right options
    left = trees_helper(arr[0...i])
    right = trees_helper(arr[i+1..-1])
    
    # combine the options
    left.each do |l|
      right.each do |r|
        node = TreeNode.new(arr[i])
        node.left, node.right = l, r
        
        combined << node
      end
    end   
  end
  
  combined
end

puts generate_trees(3)
