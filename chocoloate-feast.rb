# Source: https://www.hackerrank.com/challenges/chocolate-feast

def chocolates_by_trip(money, price, wrapper_rate)
  wrappers = chocs = money / price

  # can we get more?
  while wrappers >= wrapper_rate do
    more = wrappers / wrapper_rate
    wrappers -= more * wrapper_rate
    
    # eat them (stuffs then in his mouth, right there in front of the
    # nice shopkeeper. where are his parents?)
    chocs += more
    wrappers += more
  end

  chocs
end

puts chocolates_by_trip(10, 2, 5)
puts chocolates_by_trip(12, 4, 4)
puts chocolates_by_trip(6, 2, 2)
