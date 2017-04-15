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

def reverse(head)
  # We're asked to implement the reverse method "in place".
  # With this method, we can accomplish it in O(n) time and
  # O(1) space
  current = head
  prev = nil
  
  while current.next do
    # save next node before overwrite
    temp = current.next
    
    # point current node back to prev
    current.next = prev
    
    # update prev, current
    prev = current
    current = temp
  end
  current.next = prev # point it back
  
  current # tail is our new head
end

a = Node.new("A",
      Node.new("B",
        Node.new("C",
          Node.new("D"))))
a.print_node
puts "\n\nAfter reverse:"
a = reverse a
a.print_node
