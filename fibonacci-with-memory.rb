# implement fibonacci with memory

def fib(n, mem = [1, 1])
  return mem[n] if mem[n]
  mem[n] = fib(n - 1, mem) + fib(n - 2, mem)
end

puts fib(5000)
