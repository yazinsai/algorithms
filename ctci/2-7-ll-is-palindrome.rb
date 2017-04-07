=begin
Write code to remove duplicates from an unsorted linked list.
=end
require 'set'

class Node
  attr_accessor :data, :next_node
  
  def initialize(data, next_node)
    @data = data
    @next_node = next_node
  end
  
  def get_all
    pointer = self
    data = []
    
    loop do
      break if pointer == nil
      
      data << pointer.data
      pointer = pointer.next_node
    end
    
    data
  end
end

def is_palindrome(head)
  values = []
  current = head
  
  while !current.nil? do
    values << current.data
    current = current.next_node
  end
  
  len = values.length
  for i in 0..len/2
    return false unless values[i] == values[len - i - 1]
  end
  
  true
end
  
head = Node.new("A", 
        Node.new("B", 
          Node.new("C", 
            Node.new("B", 
              Node.new("A", nil)))))

puts head.get_all.inspect
puts is_palindrome(head).inspect

