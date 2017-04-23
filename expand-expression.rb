=begin
Find all binary strings that can be formed from given wildcard pattern
Given a binary pattern that contains ‘?’ wildcard character at few
positions, find all possible combinations of binary strings that can 
be formed by replacing the wildcard character by either 0 or 1. 

For example, for wildcard pattern 1?11?00?1?, the possible combinations are:
1011000010
1011000011
1011000110
1011000111
...
=end

# the obvious solution would be to do this recursively, and branch at
# every "?" we encounter. this would take O(2^n) time, which is equal
# to the number of possibile outcomes

def expand(expression)
  return [expression] if expression.length == 1
  
  if expression[0] == "?"
    expand("0" + expression[1..-1]) + expand("1" + expression[1..-1])
  else # prepend
    expand(expression[1..-1]).map {|e| expression[0] + e}
  end
end

def expand_i(expression)
  expanded = []
  
  stack = [expression]
  while stack.any? do
    expr = stack.pop
    if expr["?"]
      stack.push expr.sub("?", "1")
      stack.push expr.sub("?", "0")
    else
      expanded << expr
    end
  end
  expanded
end

puts expand_i("?0?1").inspect
