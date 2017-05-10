def brute(n)
  for a in 1...n
    for b in 1...n
      c = n - a - b
      return a * b * c if a * a + b * b == c * c
    end
  end
  false
end

puts brute(1000)

