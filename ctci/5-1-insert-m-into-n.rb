=begin
You are given two 32-bit numbers, N and M, and two bit positions, l 
and j. Write a method to insert M into Nsuch that M starts at bit j
and ends at bit i. You can assume that the bits j through i have 
enough space to fit all of M. That is, if M = 10011, you can assume
that there are at least 5 bits between j and i. You would not, for
example, have j = 3 and i = 2, because M could not fully fit between
bit 3 and bit 2.

EXAMPLE
Input: N=10000000000, M=10011, i=2, j=6 
Output:N=10001001100
=end

def insert_m_into_n(n, m, i, j)
  # Input:  N=10000000000, M=10011, i=2, j=6 
  # OR        00001001100
  # AND       11111001100
  # Output:   10001001100
  mask_or = m << i
  mask_and = (~0 << j) | mask_or
  (n | mask_or) & mask_and
end

puts insert_m_into_n(0b10000000000, 0b10011, 2, 6).to_s(2)
