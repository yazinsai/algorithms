# divide and conquer implementation of the closest pair algorithm
# which operates in nlogn time

require 'set'

def prepare(points)
  # sort x, y coordinates of input
  p_x = points.sort
  p_y = points.sort_by {|x,y| y}
end

def closestpair(points)
  # split points down the middle by x
  mid = points.length / 2
  q_x = p_x[0, mid]
  r_x = p_x[mid, points.length]
  

  # find q, r sorted by y (using the p_y array)
  # no sorting algos because we need this done in linear time, not O(nlogn) 
  # -> for this to work, we need to be able to access elements in q and r 
  #    directly without searching for them (so we can avoid a nested loop)
  #    To access items directly, we need q and r to be hashes (not arrays)
  # hashes are accessed in constant time O(1), not O(n)
  # hashes without values are called "sets" in Ruby
  q = q_x.to_set
  q_y = []; r_y = []
  
  # traverse p_y and cherry pick the elements of q and r in correct y-order
  for i in 0..p_y.length-1  
    if q.include? p_y[i]
      q_y << p_y[i] 
      q.delete p_y[i]
    else # if it's not in q, it's r (hence no additional set needed for r)
      r_y << p_y[i]
    end
  end

  puts "q_y = #{q_y.inspect}\nr_y = #{r_y.inspect}" #DEBUG

end

def divide
end

puts closestpair([ [0, 0], [1, 1], [4, 2], [-1, 5], [-4, -5],
                   [2,-1], [3,12], [19,1], [0, 10], [ 5,  5] ]).inspect
