=begin
You have a string consisting of open and closed parentheses, but parentheses may be 
imbalanced. Make the parentheses balanced and return the new string.

Assumptions:
- Only uses () parantheses
- Doesn't contain any other chars
=end

def balance(s)
  return s if s == ""
  
  depth = 0
  s.chars.each { |c| depth += c == "(" ? 1 : -1 }
  
  case depth <=> 0
  when -1
    s = "(" * depth.abs + s # prepend
  when 1
    s << ")" * depth    # append
  end

  s
end

puts balance("(())))")
