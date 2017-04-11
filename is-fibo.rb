# Source: https://www.hackerrank.com/challenges/is-fibo

def is_fibo(n)
  return true if [0, 1].include? n # error check

  f1 = f2 = 1 # last 2 fib's
  while n >= sum = f1 + f2 do
    return true if n == sum 

    f1, f2 = f2, sum
  end
  false
end

puts is_fibo(10**10).inspect
