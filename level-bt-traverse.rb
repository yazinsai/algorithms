=begin
Binary Tree Level Order Traversal
Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

For example:
Given binary tree [3,9,20,null,null,15,7],
    3
   / \
  9  20
    /  \
   15   7
return its level order traversal as:
[
  [3],
  [9,20],
  [15,7]
]
=end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val, left = nil, right = nil)
    @val = val
    @left, @right = left, right
  end
  
  def inspect
    @val
  end
end

def traverse(root)
  levels = [[root]]
  output = []
  
  while levels.any? do
    level = levels.shift
    output += [level] unless level.nil?
    temp = []
    
    # retrieve all children
    level.each do |node|
      next if node.nil?
      
      temp << node.left if node.left
      temp << node.right if node.right
    end
    
    levels << temp if temp.any?
  end
  
  output
end

root = 
  TreeNode.new(3,
    TreeNode.new(9),
    TreeNode.new(20,
      TreeNode.new(15),
      TreeNode.new(7)))

puts traverse(root).inspect
