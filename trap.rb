# https://leetcode.com/problems/trapping-rain-water/

def trap(height)
  water = 0
  level = 0
  left = 0; right = height.length - 1
  
  while left < right do
    if height[left] < height[right]
      lower = height[left]
      left += 1
    else
      lower = height[right]
      right -= 1
    end
    
    level = lower if lower > level
    water += level - lower
  end
  
  water
end

puts trap([0, 1, 0, 1, 0, 2, 1, 0, 2, 1, 0])
