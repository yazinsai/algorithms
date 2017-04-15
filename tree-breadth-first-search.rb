class BreadthFirstSearch
  def initialize(graph, start)
    @graph = graph
    @start = start
    
    @visited = []
    @queue = []
    @path_to = {}
    
    bfs(start)
  end
  
  def path_to(target)
    return unless @visited.include? target
    
    path = []
    current = target
    while current != @start do
      path.unshift current # prepend
      current = @path_to[current]
    end
    
    path.unshift current
  end
  
  private
  
  def bfs(node)
    @queue << node
    while !@queue.empty? do
      current = @queue.shift
      @visited << current
      
      current.adjacents.each do |node_adj|
        next if seen? node_adj
        @queue << node_adj
        @path_to[node_adj] = current
      end
    end
  end
  
  def seen?(node)
    (@visited.include? node) || (@queue.include? node)
  end
end

class Graph
  def add_edge(from, to)
    from.adjacents << to
    to.adjacents << from
  end
end

class Node
  attr_accessor :val, :adjacents
  
  def initialize(val=nil, adjacent=nil)
    @adjacents = []
    @val = val
    
    @adjacents << adjacent if adjacent
  end
  
  def to_s
    @val
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

path = BreadthFirstSearch.new(graph, node1).path_to(node5)
path.each {|n| print "#{n.to_s} -> "} if path
