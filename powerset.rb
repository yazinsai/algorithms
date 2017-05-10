=begin
Write a method that computes the power set of a given set

e.g. 
For input {a, b, c}, 
return:
  {}
  {a}
  {b}
  {c}
  {a, b}
  {a, c}
  {b, c}
  {a, b, c}
=end
require 'set'

def powerset(set)
  options = Set.new
  options << Set.new() # empty set
  for i in 1..set.length
    combs = combinations(set.to_a, i)
    combs.each {|c| options << Set.new([c])}
  end
  options
end

# Returns all possible combinations of selecting 'n' elements
# from arr[]. Remember: with combinations, order doesn't matter
def combinations(arr, n)
  return [] if n == 0
  
  options = []
  for i in 0..(arr.length - n)
    picked = arr[i] # picked one
    others = combinations(arr[i+1..-1], n - 1)
    if others.empty?
      options << picked
    else
      others.each do |p|
        options << picked + p
      end
    end
  end
  options
end

puts powerset([*?a..?c].to_set).inspect
