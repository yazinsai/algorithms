class Node
  attr_reader :val, :left, :right

  def initialize(val, left = nil, right = nil)
    @val = val
    @left, @right = left, right
  end

  def inspect
    @val
  end
end

class Iterator
  def initialize(root)
    @stack = []
    iterate_left(root)
  end

  def has_next?
    @stack.any?
  end

  def next_node
    current = @stack.pop
    iterate_left(current.right) if current.right

    current
  end

  private

  def iterate_left(node)
    while node do
      @stack.push node
      node = node.left
    end
  end
end

root =
  Node.new(8,
    Node.new(3,
      Node.new(1),
      Node.new(6)),
    Node.new(10,
      nil,
      Node.new(14)))

i = Iterator.new(root)
while i.has_next? do
  current = i.next_node
  print "#{current.inspect}, "
end
