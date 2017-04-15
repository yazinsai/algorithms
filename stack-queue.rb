class Stack
  attr_reader :top
  
  def pop
    node = @top
    @top = @top.next if @top
    node
  end
  
  def push(node)
    node.next = top
    @top = node
  end
  
  def peek
    @top
  end
end

class Queue
  attr_reader :front, :back
  
  def enqueue(node)
    # add to back of queue
    if back
      @back.next = node
      @back = node
    else
      @front = @back = node
    end
  end
  
  def dequeue
    if front
      node = front
      @front = front.next
      
      return node
    end
  end
end

class Node
  attr_reader :next, :val
  
  def initialize(val=nil, next_node=nil)
    @val = val
    @next = next_node
  end
  
  def next=(next_node)
    @next = next_node if next_node.class == Node
  end
  
  def print_chain(node=self)
    print "#{node.val} -> "
    print_chain(node.next) if node.next
  end
end

puts "Stack:"
s = Stack.new
s.push( Node.new("A") )
s.push( Node.new("B") )
s.pop
n = s.pop
puts n.val # => A

puts "\n\nQueue:"
q = Queue.new
q.enqueue( Node.new("A") )
q.enqueue( Node.new("B") )
q.enqueue( Node.new("C") )
q.dequeue.print_chain
