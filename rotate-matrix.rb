def rotate_matrix(m) # m = n*n matrix
  side = m[0].length
  
  for layer in 0...(side/2)
    # establish index limits
    first = layer
    last = side - layer - 1
    
    for i in first...last
      offset = i - first
      
      temp = m[i][last]
      m[i][last] = m[first][i]
      m[first][i] = m[last-offset][first]
      m[last-offset][first] = m[last][last-offset]
      m[last][last-offset] = temp
    end
  end
  
  m
end

def print_matrix(m)
  for i in 0...m.length
    for j in 0...m[0].length
      print m[i][j].to_s.rjust(3, " ")
    end
    print "\n"
  end
end

m=[[ 1, 2, 3, 4, 5, 6],
   [20,21,22,23,24, 7],
   [19,32,33,34,25, 8],
   [18,31,36,35,26, 9],
   [17,30,29,28,27,10],
   [16,15,14,13,12,11]]

puts "Before rotation:"
print_matrix(m)

m = rotate_matrix(m)

puts "\n\nAfter rotation:"
print_matrix(m)
