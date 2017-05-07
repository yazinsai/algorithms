# Source: http://benjamintan.io/blog/2015/03/16/how-does-symbol-to_proc-work/
# Source: https://mixandgo.com/blog/mastering-ruby-blocks-in-less-than-5-minutes

# ====
# control is passed to the block at the point of 'yield'
def my_method(str)
  puts str
  yield(str) if block_given?
  puts "all done now, go away"
end
# my_method("hi") do |str|
#   puts "yielded, with param: #{str}"
# end

# ====
# you can reference the block using the '&'
def a_method(&block)
  # ruby will call 'to_proc' on &block in an attempt to convert it to 
  # a block (if it's not a block)
  
  puts block
  block.call # does the same thing as 'yield'
end
# puts a_method { puts "i'm inside the block" }

# ====
class Fixnum
  def to_proc
    Proc.new do |obj, *args|
      puts "proc(obj=#{obj}, *args=#{args})"
      obj % self == 0
    end
  end
end

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].select(&3)
puts numbers.inspect

# ====
# custom implementation of the `map` method used in Ruby arrays
def my_map(array)
  new_array = []
  
  array.each do |elem|
    new_array.push yield(elem)
  end
  
  new_array
end
# puts (my_map([1, 2, 3]) {|n| n * 2}).inspect
