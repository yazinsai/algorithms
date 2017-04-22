=begin
Rod Cutting Problem
Given a rod of length n and list of prices of rod of length i where
1 <= i <= n, find the optimal way to cut rod into smaller rods in 
order to maximize profit.

For example, consider below rod lengths and values

Input:   
length[] = [1, 2, 3, 4, 5, 6, 7, 8]
price [] = [1, 5, 8, 9, 10, 17, 17, 20] 

Best: Cut the rod into two pieces of length 2 each
to gain revenue of 5 + 5 = 10

Cut               Profit
4                  9
1, 3              (1 + 8) = 9
2, 2              (5 + 5) = 10
3, 1              (8 + 1) = 9
1, 1, 2           (1 + 1 + 5) = 7
1, 2, 1           (1 + 5 + 1) = 7
2, 1, 1           (5 + 1 + 1) = 7
1, 1, 1, 1        (1 + 1 + 1 + 1) = 4
=end

def rod(prices, remain)
  # special case of the knapsack problem where we have items of 
  # incrementally increasing size (or weight, in the case of knapsack)
  return 0 if remain.zero?

  max_price = 0
  (1..remain).each do |i|
    price = prices[i - 1] + rod(prices, remain - i)
    max_price = [max_price, price].max
  end
  max_price
end

puts rod([1, 5, 8, 9, 10, 17, 17, 20], 4)
