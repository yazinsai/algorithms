=begin
Implement a function void reverse(char* str) in C or C++ which reverses a null- terminated string.
=end

def reverse(string)
  final = string.length - 1
  
  for i in 0..final/2
    string[i], string[final-i] = string[final-i], string[i] #swap
  end
  
  string
end

puts reverse("hello")
