class Node
  attr_accessor :data, :next_node
  
  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
  
  def print
    puts @data
    @next_node.print if @next_node
  end
end

def reverse(head)
  current = head
  prev = nil
  
  while current do
    next_node = current.next_node
    current.next_node = prev
    
    prev = current
    current = next_node
  end
  
  head = prev
end

def recursive_reverse(node)
  if node.nil? || node.next_node.nil?
    return node
  else
    temp = recursive_reverse(node.next_node)
    node.next_node.next_node = node
    node.next_node = nil
    return temp
  end
end

n = Node.new("A",
      Node.new("B",
        Node.new("C",
          Node.new("D"))))

n.print
n = reverse(n)
n.print

