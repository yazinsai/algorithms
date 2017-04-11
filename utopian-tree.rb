# Source: https://www.hackerrank.com/challenges/utopian-tree
# I'm sure there's a more mathematically pleasant way to do
# this but in a short time, this would be the easiest solution
# to come up with. It's not optimal O(n) time, O(1) space but
# it works. And this isn't a math quiz

def find_height(n)
  s = 1
  for i in 1..n
    s = i % 2 == 1 ? 2 * s : s + 1 # 2x if odd, +1 if even
  end
  s
end

puts find_height(6)
