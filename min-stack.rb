# Source: https://leetcode.com/problems/min-stack/
class MinStack
  def initialize
    @stack = []
  end
  
  def pop
    @stack.pop
  end
  
  def push(x)
    min = @stack.empty? ? x : [x, top(1)].min
    @stack.push [x, min]
  end
  
  def top(index = 0)
    @stack[-1][index] if @stack.any?
  end
  
  def get_min
    @stack[-1][1] if @stack.any?
  end
end
