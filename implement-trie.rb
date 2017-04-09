class Node
  attr_accessor :val, :children
  
  def initialize(val=nil)
    @val = val
    @children = Hash.new
  end
  
  alias p print
  def print
    p "#{val},"
    children.each {|k, v| v.print}
  end
end

class Trie
  attr_accessor :root
  
  def initialize
    @root = Node.new
  end
  
  def insert(word)
    insert_helper(word, @root)
  end
  
  def search(word)
    search_helper(word, @root)
  end
  
  def starts_with(prefix)
    !!search_helper(prefix, @root)
  end
  
  def print
    @root.print
  end
  
  private
  
  def insert_helper(word, root)
    if word == ""
      return
    else
      # create, append child node if it does not exist
      root.children[ word[0] ] = 
        Node.new(word[0]) if !root.children.include? word[0]
      
      # recurse
      insert_helper(word[1..-1], root.children[ word[0] ])
    end
  end
  
  def search_helper(word, root)
    if word == ""
      return root
    else
      return false unless root.children.include? word[0]
      search_helper(word[1..-1], root.children[ word[0] ])
    end
  end
end

t = Trie.new
t.insert("hello")
t.insert("hi")
t.insert("gorilla")
t.insert("girl")
t.print
puts t.starts_with("go").inspect
