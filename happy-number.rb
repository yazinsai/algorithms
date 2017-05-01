# Source: https://leetcode.com/problems/happy-number/

def happy?(num)
  slow = fast = num
  
  loop do
    slow = digit_square_sum(slow)
    2.times { fast = digit_square_sum(fast) }
    
    return true if slow == 1
    return false if slow == fast
  end
end

def digit_square_sum(num)
  sum = 0
  while num > 0 do
    sum += (num % 10)**2
    num /= 10
  end
  sum
end

puts happy?(19).inspect
