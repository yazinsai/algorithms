class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node)
    @value = value
    @next_node = next_node
  end
end

class Stack
  # implemented using a linked list
  attr_reader :head

  def initialize
    @head = nil
  end

  def push(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end

  def pop
    @head = @head.next_node if @head != nil
  end

  def print
    # will print in reverse
    pointer = @head
    str = "["

    while pointer.next_node != nil
      str << "#{pointer.value},"
      pointer = pointer.next_node # advance pointer
    end

    str << "#{pointer.value}]"

    str
  end
end

s = Stack.new
s.push(1)
s.push(3)
s.push(5)
s.push(99)
puts "s = #{s.print}"
s.pop
puts "s = #{s.print}"
