# Source: https://www.hackerrank.com/challenges/sherlock-and-the-beast

def largest_decent(n)
  for i in (n/3).downto(0)
    n5 = i * 3
    n3 = n - n5
    return "5" * n5 + "3" * n3 if n3 % 5 == 0
  end
	-1
end

puts largest_decent(11)
