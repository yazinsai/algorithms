=begin
Given s1, s2, s3, find whether s3 is formed by the interleaving of 
s1 and s2.

For example,
Given:
s1 = "aabcc",
s2 = "dbbca",

When s3 = "aadbbcbcac", return true.
When s3 = "aadbbbaccc", return false.
=end
def is_interleave(s1, s2, s3)
  return false if s3.length != s1.length + s2.length
  
  # base case
  return s2 == s3 if s1.empty?
  return s1 == s3 if s2.empty?
  
  if s3[0] == s1[0] && s3[0] == s2[0]
    is_interleave(s1[1..-1], s2, s3[1..-1]) || 
      is_interleave(s1, s2[1..-1], s3[1..-1])
  elsif s3[0] == s1[0]
    is_interleave(s1[1..-1], s2, s3[1..-1])
  elsif s3[0] == s2[0]
    is_interleave(s1, s2[1..-1], s3[1..-1])
  else
    false
  end
end

puts is_interleave("a", "b", "ab").inspect
