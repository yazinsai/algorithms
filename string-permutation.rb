def permutation(string)
  return [string] if string.length == 1
  
  c = string[0]
  permutation(string[1..-1]).each_with_object([]) do |p, obj|
    # inject 'c' into all the different possible places within
    # each permutation
    for i in 0..p.length
      obj << p.dup.insert(i, c) # dup so we don't edit p directly
    end
  end
end

pp permutation("ABC")
