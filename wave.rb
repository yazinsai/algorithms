def wave(a)
  # sort the array
  a.sort!
    
  # change the array in place
  i = 0
  while i < a.length do
    break if i == a.length - 1 # last element
    
    # swap
    a[i], a[i+1] = a[i+1], a[i]
    i += 2
  end
  
  a
end

puts wave([5, 1, 3, 2, 4]).inspect
