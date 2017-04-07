X = 0
Y = 1

def cover_points(start, points)
  # points is a 2d array [ [1,1], [2, 5], ... ]
  current = start
  moves = 0
  
  points.each do |x, y|
    loop do      
      dist = [ x - current[X], y - current[Y] ]
      dir  = [ dist[X] > 0 ? 1 : -1, dist[Y] > 0 ? 1 : -1 ]
      
      # move, maximum once in either direction
      if dist[X].abs > 0
        current[X] += dir[X] 
        dist[X] -= dir[X] 
      end
      if dist[Y].abs > 0
        current[Y] += dir[Y]
        dist[Y] -= dir[Y]
      end
      moves += 1
      
      break if dist == [0, 0] # end condition
    end # loop
  end
  moves
end

puts cover_points([0, 0], [ [1, -2], [1, 7] ])
