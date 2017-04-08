=begin
Given a singly linked list, group all odd nodes together followed by the even
nodes. Please note here we are talking about the node number and not the value
in the nodes.

You should try to do it in place. The program should run in O(1) space 
complexity and O(n) time complexity.

Source: https://leetcode.com/problems/odd-even-linked-list/#/description
=end

class Node
  attr_accessor :data, :next_node
  
  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
  
  def print
    data + ", #{next_node.print if next_node}"
  end
end

# If we're going to move things in-place, then we can expect to have to
# accumulate odd / even items as we go along.
#
# For example: 
# *A, B, C, D, E
#  A,*B, C, D, E -> A, C, B, D, E
#  A, C,*B, D, E
#  A, C, B,*D, E
#  A, C, B, D,*E -> A, C, E, B, D
#
# 

def even_odd(head)
  return head if head.nil? || head.next_node.nil? # Need at least 2 nodes
  
  odd_tail = head
  current = head.next_node
  while current && current.next_node do
    next_node = current.next_node

    current.next_node = next_node.next_node # skip over odd element
    even_head = odd_tail.next_node # beginning of even chain

    odd_tail.next_node = next_node # link to previous node
    next_node.next_node = even_head # link to next node

    odd_tail = next_node # update odd_tail
    
    current = current.next_node # move forward
  end
  
  head
end

n = Node.new("A",
      Node.new("B",
        Node.new("C",
          Node.new("D",
            Node.new("E")))))
puts n.print
n = even_odd(n)
puts n.print
