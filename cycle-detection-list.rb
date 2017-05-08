=begin
Given a linked list, determine if it has a cycle in it. Can you 
solve it without using extra space? (You bet!)

Source: https://leetcode.com/problems/linked-list-cycle/
=end

class Node
  attr_accessor :val, :next
  
  def initialize(val, next_node = nil)
    @@called = 0
    
    @val = val
    @next = next_node
  end
  
  def to_s
    return "..." if (@@called += 1) > 8 # got a 🚲 on our 👐 
    "#{@val}-> #{@next.to_s if @next}"
  end
  
  def ==(node)
    @val == node.val
  end
end

def cycle?(head)
  slow, fast = head, head
  loop do
    slow = slow.next
    fast = fast.next.next
    
    return false if fast.nil? # reached end
    return true if slow == fast # we be cyclin'
  end
end

nodes = [*?A..?D].map {|e| Node.new(e) }
nodes[0].next = nodes[1]
nodes[1].next = nodes[2]
nodes[2].next = nodes[3]
nodes[3].next = nodes[1] # cycle-o-pedia action

puts nodes[0].to_s
puts cycle?(nodes[0])
