class Node
  attr_accessor :data, :left, :right
  
  def initialize(data=nil, left=nil, right=nil)
    @data = data
    @left = left; @right = right
  end
  
  def valid?(min=nil, max=nil)
    if @left.nil? && @right.nil? 
      # base case (leaf node)
      return false if min && @data < min ||
                      max && @data >= max
      true
    else
      return false if @left && !@left.valid?(min, @data) ||
                      @right && !@right.valid?(@data, max)
      true
    end
  end
end

root = 
  Node.new(10,
    Node.new(5,
      Node.new(2), Node.new(7)),
    Node.new(15,
      Node.new(8), Node.new(20))) # invalid, 8 < 10...15

puts root.valid?.inspect
