# Source: https://leetcode.com/problems/count-and-say/

# @param {Integer} n
# @return {String}
def count_and_say(n)
  return "1" if n == 1 # base case
    
  sequence = count_and_say(n - 1)
  compress(sequence)
end

def compress(str)
  # receives "112222111" and returns "214231" (two 1's, 
  # four 2's, three 1's)
  prev, count = str.chr, 1
  compressed = ""
  
  for i in 1...str.length
    if str[i] != prev
      compressed += "#{count}#{prev}"
      count, prev = 0, str[i]
    end
    count += 1
  end
  compressed += "#{count}#{prev}"
end
