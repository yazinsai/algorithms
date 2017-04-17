# Implement an algorithm to print all valid (e.g., properly 
# opened and closed) combinations of n-pairs of parentheses.
# EXAMPLE
# Input: 3
# Output: ((())), (()()), (())(), ()(()), ()()()

def brackets(n)
  return ["()"] if n == 1
  
  brackets(n-1).each_with_object([]) do |p, obj|
    for i in 0..p.length
      elem = p.dup.insert(i, "()")
      obj << elem unless obj.include? elem
    end
  end
end

puts brackets(3)
