require 'set'

# Implemented in O(m) time [m = # of lines], O(1) space
def count_gem_stones(c)
  gem_stones = c[0].chars.to_set
  for i in 1...c.length
    gem_stones.each do |s|
      gem_stones.delete s unless c[i].include? s
    end
  end
  gem_stones.length
end

puts count_gem_stones(["abcdde", "baccd", "eeabg"])
