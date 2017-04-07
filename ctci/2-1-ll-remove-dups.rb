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

def remove_dups(head)
  values = Set.new
  
  # iterate through the linkedlist
  current  = head
  previous = nil
  
  while !current.nil? do
    if values.include? current.data
      # remove the duplicate
      previous.next_node = current.next_node
    else
      # add it
      values << current.data
      previous = current
    end
    
    current = current.next_node
  end
  
  head
end
  
head = Node.new(2, 
        Node.new(3, 
          Node.new(2, 
            Node.new(2, nil))))
puts head.get_all.inspect
remove_dups(head)
puts head.get_all.inspect

