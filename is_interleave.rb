def is_interleave(s1, s2, s3)
  # iterate s3 from right to left
  while !s3.empty? do
    char = s3[-1]
    
    # can we find this character anywhere?
    if !s1.empty? && char == s1[-1]
      s1.chop!
    elsif !s2.empty? && char == s2[-1]
      s2.chop!
    else
      return 0
    end
    
    s3.chop!
  end
  
  return 1
end

puts is_interleave("B", "e", "Be")
