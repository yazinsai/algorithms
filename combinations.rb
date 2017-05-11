=begin
Given two integers n and k, return all possible combinations of k 
numbers out of 1 ... n.

For example,
If n = 4 and k = 2, a solution is:

[
  [2,4],
  [3,4],
  [2,3],
  [1,2],
  [1,3],
  [1,4],
]
=end

def combinations(arr, n)
  return [] if n == 0 # base case
  
  options = []
  for i in 0..(arr.length - n)
    fixed = arr[i]
    others = combinations(arr[i+1..-1], n - 1)
    if others.empty?
      options << [fixed]
    else
      others.each do |e|
        options << [fixed, *e]
      end
    end
  end
  options
end

puts combinations([*1..4], 2).inspect
