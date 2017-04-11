# Source: https://www.hackerrank.com/challenges/sherlock-and-the-beast

def largest_decent(n)
  # find decent numbers, in decreasing value
  return ("5" * n).to_i if n % 3 == 0
  
  for i in (n/3).downto(0)
    n5 = i * 3 # number of 5's
    n3 = n - n5 # remainder
    return ("5" * n5 + "3" * n3).to_i if n3 > 0 && n3 % 5 == 0
  end
  
  return ("3" * n).to_i if n % 5 == 0
  
  -1
end

puts largest_decent(11)
