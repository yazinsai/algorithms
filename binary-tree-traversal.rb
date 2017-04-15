class Node
  attr_reader :val, :left, :right
  
  def initialize(val=nil, left=nil, right=nil)
    @val = val
    @left, @right = left, right
  end
  
  def traverse
    # implements in order traversal (left, current, right)
    left.traverse if left
    puts val
    right.traverse if right
  end
  
  def traverse_preorder
    # root, left, right
    puts val
    left.traverse_preorder if left
    right.traverse_preorder if right
  end
  
  def traverse_postorder
    # left, right, root
    left.traverse_postorder if left
    right.traverse_postorder if right
    puts val
  end
end

n =
Node.new("10",
  Node.new("5",
    Node.new("3"), Node.new("7")),
  Node.new("13",
    Node.new("11"), Node.new("15")))

puts "In-order traversal: "
n.traverse

puts "\n\nPre-order traversal: "
n.traverse_preorder

puts "\n\nPost-order traversal: "
n.traverse_postorder
