# brute force
def gcd_brute(a, b)
  for i in b.downto(1)
    return i if a % i == 0 && b % i == 0
  end
end

# Euclidean algoritm
def gcd(a, b)
  if a == b # base case
    return a
  else
    a, b = b, a if b > a # make sure a > b
    gcd(a - b, b)
  end
end

def gcd_many(*args)
  raise ArgumentError if args.length < 2
  args.inject(&:gcd)
end

puts gcd_many(40, 20, 30, 150)
