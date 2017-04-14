class Node
  attr_reader :val, :next
  
  def initialize(val=nil, next_node=nil)
    @val = val
    @next = next_node
  end
  
  def next=(link)
    @next = link
  end
  
  def append(val)
    tail = Node.new(val)
    
    pointer = self
    while pointer.next do
      pointer = pointer.next
    end
    
    pointer.next = tail
  end
  
  def print_node(node=self)
    print "#{node.val} -> "
    print_node node.next if node.next
  end
end

n = Node.new(5,
      Node.new(4))
n.print_node
puts "\n\nAfter append:"
n.append 3
n.print_node
