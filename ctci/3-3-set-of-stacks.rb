=begin
Imagine a (literal) stack of plates. If the stack gets too high, it might topple. Therefore, in real life, we would likely start a new stack when the previous stack exceeds somethreshold. Implement a data structureSetOf Stacks that mimics this. SetOf Stacks should be composed of several stacks and should create a newstackoncethe previous oneexceedscapacity. SetOfStacks.push() and SetOfStacks.pop() shouldbehaveidenticallytoasinglestack(thatis,popO should return the same values as it would if there were just a single stack).
=end

class SetOfStacks
  CAPACITY = 3
  @stacks
  
  def initialize
    @stacks = []
  end
  
  def push(value)
    add_stack if @stacks.empty? || @stacks.last[1] == CAPACITY
    
    @stacks.last[0].push(value)
    @stacks.last[1] += 1
  end
  
  def pop
    value = @stacks.last[0].pop
    @stacks.last[1] -= 1
    
    remove_stack if @stacks.last[1] == 0
    
    value
  end
    
  private

  def add_stack
    @stacks << [Stack.new, 0] # size = 0
  end

  def remove_stack
    @stacks.pop
  end
    
end

class Stack
  @top
  
  def initialize
    @top = []
  end
  
  def push(value)
    @top.push(value)
  end
  
  def pop
    @top.pop
  end
end

set = SetOfStacks.new
puts set.push(1), set.push(2), set.push(3), set.push(4)
puts set.pop, set.pop, set.pop, set.pop
