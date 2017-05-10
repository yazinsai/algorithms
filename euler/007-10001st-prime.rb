require 'set'

def get_primes(n)
  primes = (1..n).to_set
  sqrt_n = n**0.5
  for i in 2..sqrt_n
    for j in 2..n/i
      primes.delete j * i
    end
  end
  primes.to_a - [1]
end

puts get_primes(200000)[10_000].inspect
