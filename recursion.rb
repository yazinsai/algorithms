

def reverse(string)
  # base case
  return string if string.length == 1

  # still more chars .. keep going
  string[-1] + reverse(string[0..-2])
end

puts reverse("abc")
