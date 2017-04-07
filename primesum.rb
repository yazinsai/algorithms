def primesum(a)
  # a is even, > 2
  
  for i in 2..a-1
    return [i, a-i] if is_prime(i) and is_prime(a-i)
  end
end

def is_prime(n)
  max_prime = (n**0.5).floor
  for i in 2..max_prime
    return false if n % i == 0
  end
  
  true
end

puts primesum(13915).inspect
