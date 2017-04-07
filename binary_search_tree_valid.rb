class Node
  include Enumerable
  
  attr_reader :data, :left, :right
  
  def initialize(data = nil, l = nil, r = nil)
    @data = data
    self.left= l
    right = r
  end
  
  def each(&block)
    left.each(&block) unless left.nil?
    yield data
    right.each(&block) unless right.nil?
  end
  
  def left=(value)
    puts "called left"
    @left = value if same_class?(value)
  end
  
  def right=(value)
    puts "called right"
    @right = value if same_class?(value)
  end
  
  def valid?
    each_cons(2).all? {|a, b| (a <=> b) <= 0} # a <= b
  end
  
  private 
  
    def same_class?(obj)
      obj.class == self.class
    end
end

=begin
root = 
  Node.new(10,
    Node.new(5,
      Node.new(2), Node.new(7)),
    Node.new(15,
      Node.new(10), Node.new(20)))
=end

n = Node.new(10, Node.new(0))
puts n.left.inspect
