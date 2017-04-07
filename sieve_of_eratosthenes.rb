require 'set'

def find_primes(limit)
  # assume all numbers are prime
  primes = (2..limit).to_set
  
  # iterate through limit; just check to sqrt(limit)
  for i in 2..(limit**0.5).floor
    # remove all factors of i
    for j in 2..limit/i
      primes.delete(i*j)
    end
  end
  
  # all done
  primes
end

puts find_primes(1000).inspect
