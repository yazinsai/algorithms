require 'set'

class Node
  attr_reader :name, :successors
  
  def initialize(name=nil)
    @name = name
    @successors = []
  end
  
  def add_edge(successor)
    successors << successor
  end
  
  def to_s
    "#{@name} -> [#{@successors.map(&:name).join(', ')}]"
  end
end

class Graph
  def initialize
    @nodes = Hash.new
  end
  
  def add_node(node)
    @nodes[ node.name ] = node
  end
  
  def add_edge(predecessor_name, successor_name)
    # add bidirectional link
    @nodes[predecessor_name].add_edge(@nodes[successor_name])
    @nodes[successor_name].add_edge(@nodes[predecessor_name])
  end
  
  def [](name)
    @nodes[name]
  end
 
  def traverse
    @nodes.each do |k, v|
      puts v
    end
  end
  
  private
  
end

g = Graph.new
g.add_node(Node.new "a")
g.add_node(Node.new "b")
g.add_node(Node.new "c")
g.add_node(Node.new "d")
g.add_edge("a", "b")
g.add_edge("c", "d")
g.add_edge("c", "b")
g.traverse
