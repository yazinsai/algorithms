require 'set'

class DepthFirstSearch
  def initialize(graph, start)
    @graph = graph
    @start = start
    @visited = []
    @path_to = {}
    
    dfs(start)
  end
  
  def path_to(target)
    return unless @visited.include? target
    
    # Start at the target
    current = target
    path = []
    while current != @source do
      path.unshift current
      current = @path_to[current]
    end
    
    # Append the source node and return
    path.unshift @source
  end
  
  private
  
  def dfs(node)
    # Add node to visited *first* in order to prevent an infinite
    # loop if a child links to the source node
    @visited << node
    
    # Iterate over the child nodes
    node.adjacents.each do |node_adj|
      next if @visited.include? node_adj
      
      dfs(node_adj)
      @path_to[node_adj] = node # Save the path back
    end
  end
end

class Graph
  # We are dealing with an undirected graph,
  # so I update the "adjacents" in both sides.
  def add_edge(node_a, node_b)
    node_a.adjacents << node_b
    node_b.adjacents << node_a
  end
  
  
end

class Node
  attr_accessor :val, :adjacents
  
  def initialize(val=nil)
    @val = val
    @adjacents = Set.new
  end
  
  def to_s
    val
  end
end

# Test
node1 = Node.new("Node #1")
node2 = Node.new("Node #2")
node3 = Node.new("Node #3")
node4 = Node.new("Node #4")
node5 = Node.new("Node #5")

graph = Graph.new
graph.add_edge(node1, node2)
graph.add_edge(node1, node5)
graph.add_edge(node2, node3)
graph.add_edge(node2, node4)
graph.add_edge(node4, node5)

path = DepthFirstSearch.new(graph, node1).path_to(node5)
path.each {|n| puts n.to_s}
