# Write a recursive function to reverse the words in a string,
# i.e., ”cat is running” becomes ”running is cat”
def reverse_words(string)
  return string unless string.include? " "
  
  # top down
  first_word = string.split(" ")[0]
  remainder = string[(first_word.length + 1)..-1]
  reversed = reverse_words(remainder)
  
  # bottom up
  return reversed + " " + first_word
end
pp reverse_words("cat in the hat")

# Write a recursive function to reverse a string
def reverse(string)
  return string if string.length < 2
  
  reversed = reverse(string[1, string.length]) # <-- top bottom
  reversed + string[0] # <-- bottom up
end
# pp reverse("abcdef")
