class Solution
  def gcd(a, b)
    # base cases
    return b if a == 0
    return a if b == 0

    # make a the bigger number
    if b > a then a, b = b, a end

    # eucledian algorithm
    return b if (rem = a % b) == 0
    gcd(b, rem)
  end
end

puts Solution.new.gcd(270, 192)
