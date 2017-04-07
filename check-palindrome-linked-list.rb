=begin
Given a singly linked list, determine if it is a palindrome. Could you do it in O(n) time and O(1) space?
=end

class Node
  attr_accessor :data, :next_node
  
  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
  
  def print
    puts @data
    @next_node.print if @next_node
  end
end

def palindrome?(node)
  # We're going to use two pointers: slow and fast. Slow pointer moves 1 step
  # at a time. Fast pointer moves 2 at a time. When fast hits the end of the
  # list, the slow pointer would be at the middle.
  # We'll compare the second half of the list with the first half to determine
  # if the string is a palindrome
  #   madam   <-- ma,d,am
  #   racecar <-- rac,e,car
  slow = fast = node
  
  while !fast.nil? do
    slow = slow.next
    fast = slow.next if slow
  end
  
  # Now, slow points to middle element
  start = node
  while slow.next do
    return false unless start.data == slow.data
  end
  # Error: This previous loop compares the left half of the palindrome
  # e.g. "ma" from madam with the right half "am" in reverse order. We could
  # either use a stack to push/pop the chars to verify they're the same OR
  # we'll have to reverse one of the sides
  
  true
end

n = Node.new("A",
      Node.new("B",
        Node.new("C",
          Node.new("A") )))
n.print
puts palindrome?(n).inspect
