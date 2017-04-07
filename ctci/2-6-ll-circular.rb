=begin
Write code to remove duplicates from an unsorted linked list.
=end
require 'set'

class Node
  attr_accessor :data, :next_node
  
  def initialize(data, next_node)
    @data, @next_node = data, next_node
  end
  
  def delete(head)
    pointer = head
    previous = nil
    
    while pointer != self do
      previous = pointer
      pointer = pointer.next_node
    end
    
    pointer.next_node = self.next_node
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

def find_circular(head)
  values = Set.new
  
  # iterate through the linked list
  current = head
  while !current.nil? do
    return current.data if values.include? current.data
    
    # store, and advance
    values << current.data
    current = current.next_node
  end
  
  nil # no circular reference found
end
  
head = Node.new("A", 
        Node.new("B", 
          Node.new("C", 
            Node.new("D", 
              Node.new("E", 
                Node.new("C", nil))))))

puts head.get_all.inspect
puts find_circular(head).inspect

