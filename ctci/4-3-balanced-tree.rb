=begin
Given a sorted (increasingorder) array with unique integer elements, write an algorithm to createa binary search tree with minimal height
=end

Node = Struct.new(:data, :left, :right)

class BinarySearchTree
  attr_accessor :root
  
  def initialize
    # do nothing
  end
  
  def insert(value, node)
    # If no root, create it 
    return @root = Node.new(value) if @root.nil?
    
    dir = value > node.data ? :right : :left
    
    if node[dir].nil?
      # Direct insert
      node[dir] = Node.new(value)
    else
      # Recurse
      insert(value, node[dir])
    end
  end
  
  def search(value, node=nil)
    return false if node.nil? # not found
    
    case value <=> node.data
    when 0
      true # found
    when 1
      search(value, node.right) 
    when -1
      search(value, node.left)
    end
  end

  def print(root=@root, depth=0)
    return if root.nil?
    
    # print
    puts "."*depth + "#{root.data}"
    
    # recurse
    print(root.left, depth + 1) unless root.left.nil?
    print(root.right, depth + 1) unless root.right.nil?
  end
  
  def delete(value, node=nil, parent=nil)
    return false if node.nil?
    
    case value <=> node.data
    when 0
      # found it
      if !node.right.nil?
        replace_with = node.right
      elsif !node.left.nil?
        replace_with = node.left
      end
      return replace_with
    when 1
      found = delete(value, node.right, node)
      if found
        node.right = found
      end
      false
    when -1
      found = delete(vaule, node.left, node)
      if found
        node.left = found
      end
      false
    end
  end
  
end

def min_height(a, min, max)
  # @accepts sorted integer array
  # @return array that you can insert sequentially

  # base case
  return if min > max
  
  # construct left, right
  mid = (min + max) / 2
  n = Node.new
  n.data = a[mid]
  n.left = min_height(a, min, mid - 1)
  n.right = min_height(a, mid + 1, max)
  
  return n
end

puts min_height([*1..16], 0, 15).inspect
=begin

  def insert(value)
    return @root = Node.new(value) if @root.nil?
    
    # start at the top
    pointer = @root
    
    # traverse
    while !pointer.nil? do
      next_node = value > pointer.data ? pointer.right : pointer.left
      if next_node.nil?
        # empty, just insert
        next_node = Node.new(value)
        break
      else
        # continue searching
        pointer = next_node
      end
    end
  end
  
  def search(value)
    # start at the top
    pointer = @root
    
    # traverse
    while !pointer.nil? do
      # found it?
      return pointer if pointer.data == value
      
      # keep going
      pointer = value > pointer.data ? pointer.right : pointer.left
    end
    
    false
  end

  def delete(value, start=@root, parent=nil) # recursive
    return false if start.nil? # empty tree, or not found
    
    if value == start.data
      # found .. now find replacement
      if !start.right.nil?
        replace_with = start.right
      elsif !start.left.nil?
        replace_with = start.left
      else
        replace_with = nil
      end
      
      if parent.nil?
        @root = replace_with
      elsif value > parent.data
        parent.right = replace_with
      else
        parent.left = replace_with
      end
    else
      # advance
      next_node = value > start.data ? start.right : start.left
      delete(value, next_node, start)
    end # if
  end

=end
