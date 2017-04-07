START = 0
HEIGHT = 1

def max_rectangle_area(data)
  return 0 if !data || data.empty?
  
  data << 0 # so we process the last element too
  max_area = 0
  stack = [] # << [position, height]
  
  for i in 0...data.length
    if stack.empty? || data[i] > stack[-1][HEIGHT]
      stack.push [i, data[i]]
    else
      furthest_back = i
      while !stack.empty? && data[i] < stack[-1][HEIGHT]
        # was the last rectangle (that's now gone) the largest?
        start, height = stack.pop
          furthest_back = [start, furthest_back].min
        area = height * (i - start)
        max_area = area if area > max_area
      end
      stack.push [furthest_back, data[i]] # track this item
    end
  end
  
  max_area
end

puts max_rectangle_area([0, 1, 0, 1, 3, 2, 0, 1, 0, 1]).inspect
