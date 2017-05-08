=begin
Given a singly linked list, determine if it is a palindrome. Could you 
do it in O(n) time and O(1) space?
=end

class Node
  attr_reader :val
  attr_accessor :next
  
  def initialize(val, next_node = nil)
    @val = val
    @next = next_node
  end
  
  def to_s
    "#{@val}-> #{@next.to_s if @next}"
  end
end

def palindrome?(head)
  slow, fast = head, head
  
  # fast forward to end of list (n/2 time)
  while fast && fast.next do
    slow = slow.next
    fast = fast.next.next
  end
  
  # reverse second half of list (n/2 time)
  reversed = reverse(slow)
  
  # compare the two halves (n/2 time)
  while reversed do
    return false if reversed.val != head.val
    reversed = reversed.next
    head = head.next
  end
  true
end

def reverse(head)
  # in place reversal of a linked list
  prev = nil
  current = head
  
  while current do
    temp = current.next
    current.next = prev
    
    prev = current
    current = temp
  end
  prev
end

node =
  Node.new("A",
    Node.new("C",
      Node.new("B",
        Node.new("C",
          Node.new("A")))))
puts palindrome?(node).inspect
