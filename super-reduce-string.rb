# Source: https://www.hackerrank.com/challenges/reduced-string

def reduce(str)
  stack = []
  str.chars.each do |c|
    c == stack[-1] ? stack.pop : stack.push(c)
  end
  stack.empty? ? "Empty String" : stack.join
end

puts reduce("abccbdaa")
