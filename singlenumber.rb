def singlenumber(a)
  a.sort!
  
  while !a.empty? do
    current = a.shift
    return current if a.empty? or a.shift != current
  end
end

puts singlenumber([1,2,3,2,3,4,1]).inspect
