# Count recursively the total number of "abc" and "aba" 
# substrings that appear in the given string.
# countAbc("abc") → 1
# countAbc("abcxxabc") → 2
# countAbc("abaxxaba") → 2
def count_abc(string)
  return 0 if string.nil? || string.length == ""
  
  # top down
  if string[0, 3][/ab[ac]/]
    1 + count_abc(string[3..-1])
  else
    count_abc(string[1..-1])
  end
end
# puts count_abc("abaxxaba")
