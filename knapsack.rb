=begin
Given a set of items, each with a weight and a value, determine the
maximum total value that can be placed inside the knapsack. Items are
indivisible; you either take an item or not. You can only take 1 unit
of each item.

For example,

Input:   
value = [ 20, 5, 10, 40, 15, 25 ]
weight = [ 1, 2, 3, 8, 7, 4 ]
int W = 10

Output: Knapsack value is 60

(value = 20 + 40 = 60
weight = 1 + 8 = 9 < W) 

Source: http://www.techiedelight.com/0-1-knapsack-problem/
=end

def knapsack(values, weights, capacity)
  # to get the optimal value, i see no way forward outside of just 
  # bruting our way through all possible scenarios. recursion will
  # get us there
  return -Float::INFINITY if capacity < 0
  return 0 if values.empty? || capacity == 0
  
  include = values[0] + knapsack(values[1..-1], weights[1..-1], 
              capacity - weights[0])
  exclude = knapsack(values[1..-1], weights[1..-1], capacity)
  
  # in real life, we'd just take everything now wouldn't we :)
  return [include, exclude].max
end

puts knapsack([ 20, 5, 10, 40, 15, 25 ], [ 1, 2, 3, 8, 7, 4 ], 10)
