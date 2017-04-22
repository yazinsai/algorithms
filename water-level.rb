=begin
Source:
http://www.techiedelight.com/trapping-rain-water-within-given-set-bars/
=end

def water(heights)
  left, right = 0, heights.length - 1
  water = 0 # start at no water
  level = 0
  
  while left < right do
    lower = [heights[left], heights[right]].min
    water += [0, level - lower].max
    level = [level, lower].max
    
    # advance
    heights[left] >= heights[right] ? right -= 1 : left += 1
  end
  
  water
end

puts water([7, 0, 4, 2, 5, 0, 6, 4, 0, 5])
