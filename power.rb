def power(a, n) # computes a^n in O(logn) time
  return 1 if n == 0
  
  x = power(a, n/2)
  n.even? ? x * x : a * x * x
end

puts power(5, 8)
