class Queue
  # Implements a queue using two stacks
  def initialize
    @stack_newest = Stack.new
    @stack_oldest = Stack.new
  end
  
  def enqueue(val)
    @stack_newest.push(val)
  end
  
  def dequeue
    if @stack_oldest.peek.nil? # empty?
      # reverse newest elements into oldest
      while e = @stack_newest.pop do
        @stack_oldest.push e
      end
    end
    
    @stack_oldest.pop
  end
  
  private
  
  @stack_newest
  @stack_oldest
end

class Stack
  def initialize
    @stack = []
  end
  
  def push(val)
    @stack.push(val)
  end
  
  def pop
    @stack.pop
  end
  
  def peek
    @stack[-1]
  end
  
  private
  
  @stack
end

q = Queue.new
q.enqueue("A")
q.enqueue("B")
q.enqueue("C")
puts q.dequeue
puts q.dequeue
q.enqueue("D")
q.enqueue("E")
puts q.dequeue
puts q.dequeue
puts q.dequeue
