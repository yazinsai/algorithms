class Node
  attr_reader :val, :next
  
  def initialize(val=nil, next_node=nil)
    @val = val
    @next = next_node
  end
  
  def next= (next_node)
    @next = next_node
  end
  
  def print_node(node=self)
    print "#{node.val} -> "
    print_node node.next if node.next
  end
end

def reverse(node)
  # Now, we want to reverse the node using recursion.
  if node.next.nil? 
    return node
  else
    temp = reverse(node.next)
    node.next.next = node # backlink
    node.next = nil # sets a->next = nil to prevent cyclic call
    return temp
  end
end

a = Node.new("A",
      Node.new("B",
        Node.new("C",
          Node.new("D"))))
a.print_node
puts "\n\nAfter reverse:"
a = reverse a
a.print_node
