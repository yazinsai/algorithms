=begin
Implement a method to perform basic string compression using the counts of repeated characters. For example, the string aabcccccaaa would become a2blc5a3. If the "compressed" string would not become smaller than the orig- inal string, your method should return the original string.
=end

def compress(string)
  return string if string.length <= 1
  
  compressed = ""
  prev = string[0]
  count = 1
  
  for i in 1..string.length-1
    if prev == string[i]
      count += 1
    else
      # different character
      compressed << "#{prev}#{count}"
      
      prev = string[i]
      count = 1
    end
  end
  
  compressed << "#{prev}#{count}"
  
  return compressed unless compressed.length > string.length
  string
end

puts compress("aabccccca")
