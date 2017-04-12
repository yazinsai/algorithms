# Source: https://www.hackerrank.com/challenges/luck-balance

def luck_score(n, k, luck, imp)
  sum = 0
  important = []
  
  for i in 0...n
    important << luck[i] if imp[i] == 1
    sum += luck[i]
  end
  
  min_imp = min(important, important.length - k)
  sum - 2 * min_imp.inject(&:+) # twice, because we added it in 'sum'
end

def min(a, n) # returns minimum 'n' elements from 'a'
  min = Array.new(n, Float::INFINITY)
  for i in 0...a.length
    min[min.index min.max] = a[i] if a[i] < min.max
  end
  min
end

=begin
# My initial understanding of the problem was that Lena would have
# to win K important competitions at minimum. Turns out that was 
# incorrect, and Lena would have to *lose* K important competitions
# at minimum. I've kept this solution here.

def luck_score(n, k, luck, imp)
  min_imp = Array.new(k, Float::INFINITY)
  sum = 0
  
  for i in 0...n
    # from the important contetsts, we'll win the k contests
    # with the smallest Luck values (since these will be deducted
    # from our total Luck score)
    # 
    # Always replace the biggest value we have
    puts min_imp.inspect
    if imp[i] == 1 && luck[i] < m = min_imp.max
      min_imp[ min_imp.index m ] = luck[i]
    end
    
    sum += luck[i]
  end
  
  sum - min_imp.inject(&:+)
end
=end

puts luck_score(6, 3, [5, 2, 1, 8, 10, 5], [1, 1, 1, 1, 0, 0])
