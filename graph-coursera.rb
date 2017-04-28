class Search
  def breadth_first(start, explored = [])
    queue = [start]
    
    while queue.any? do
      current = queue.shift
      next if explored.include? current.val
      
      explored << current.val
      puts "#{current.val}," # process current node
      current.adjacents.each do |adj|
        queue << adj
      end
    end # while
  end
  
  def count_isolated(graph)
    # counts the isolated "sections" of the graph using an
    # outer loop that checks all of the graph vertices (to
    # make sure we don't miss any!)
    count = 0
    explored = []
    
    graph.nodes.each do |val, node|
      next if explored.include? val
      
      breadth_first(node, explored)
      count += 1
    end
    
    count
  end
  
  def depth_first(start, explored = [])
    stack = [start]
    
    while stack.any? do
      current = stack.pop
      next if explored.include? current.val
      
      explored << current.val
      puts "#{current.val}," # process current node
      current.adjacents.each do |adj|
        stack.push adj
      end
    end
  end
  
  def depth_first_recursive(start, explored = [])
    return if explored.include? start.val
    
    explored << start.val
    puts "#{start},"
    start.adjacents.each do |adj|
      depth_first_recursive(adj, explored)
    end
  end
  
  def topological_search(graph)
    current_label = graph.nodes.length
    explored = []
    
    graph.nodes.each do |node|
      next if explored.include? node
      
      # depth_first_search will need to be modified to set
      # the index of the node to current_label and then 
      # decrement current_label after processing each 
      # end-node. See
      # https://www.coursera.org/learn/algorithms-graphs-data-structures/lecture/yeKm7/topological-sort
      current_label = depth_first_search(node, current_label)
    end
  end
end

class Graph
  attr_accessor :nodes
  
  def initialize
    @nodes = Hash.new
  end
  
  def add_edge(from, to)
    # automatically add to nodes[]
    [from, to].each do |node| 
      nodes[node.val] = node unless nodes.include?(node.val)
    end
    
    nodes[from.val].adjacents << to
  end
end

class Node
  attr_accessor :adjacents, :val
  
  def initialize(val = nil, adjacent = nil)
    @val = val
    @adjacents = []
    
    @adjacents << adjacent if adjacent
  end
  
  def to_s
    val
  end
  
  def inspect
    val
  end
end

nodes = "sabcde".chars.each_with_object({}) {
  |c, obj| obj[c] = Node.new(c) }
#     A---C---E
#    / \   \ /
#   S---B---D
g = Graph.new
g.add_edge(nodes[?s], nodes[?a])
g.add_edge(nodes[?s], nodes[?b])
g.add_edge(nodes[?a], nodes[?b])
g.add_edge(nodes[?a], nodes[?c])
g.add_edge(nodes[?b], nodes[?d])
g.add_edge(nodes[?c], nodes[?d])
g.add_edge(nodes[?c], nodes[?e])
g.add_edge(nodes[?d], nodes[?e])

s = Search.new
s.depth_first(nodes[?s])
