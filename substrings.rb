def substrings(str)
  (0...str.length).each_with_object([]) do |i, subs|
    (i...str.length).each do |j|
      subs << str[i..j]
    end
  end
end

def substringr(str)
  return [] if str.empty?
  
  # top bottom
  subs = []
  str.length.times do |i|
    subs << str[0..i]
  end
  subs + substringr(str[1..-1]) # bottom up
end

puts substrings("hello").inspect
puts "\n\nRecursive now:"
puts substringr("hello").inspect
