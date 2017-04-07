def remove_duplicates(a)
  prev = nil
  i = 0
  
  # iterate through the array
  while i < a.length
    if a[i] == prev
      # duplicate
      a.delete_at(i); 
      
      i -= 1
    end
    
    prev = a[i]
    i+= 1
  end

  i - 1
end

puts remove_duplicates([0, 1, 1, 1, 2, 3, 4, 4, 5, 10]).inspect
