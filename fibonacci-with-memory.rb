# implement fibonacci with memory

def fibonacci(i, mem=[])
  if [1, 2].include? i
    1
  else
    mem[i - 1] = fibonacci(i - 1, mem) unless mem[i - 1]
    mem[i - 2] = fibonacci(i - 2, mem) unless mem[i - 2]
    mem[i] = mem[i-1] + mem[i-2]
  end
end

puts fibonacci(5000)
