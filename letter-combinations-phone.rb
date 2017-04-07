def letter_combinations(digits)
  options = []
  
  for i in 0...digits.length
    chars = chars(digits[i])
    
    if chars.empty? || options.empty?
      options += chars # unchanged if chars = []
      next
    end
    
    current_options, options = options, []
    chars.each do |c|
      # loop over current options (exclude longer ones we're adding)
      for j in 0...current_options.length
        options << (current_options[j] + c)
      end
    end
  end
  
  options
end

def chars(digit)
  charmap = [
    "", "", "abc", "def", "ghi", "jkl", 
    "mno", "pqrs", "tuv", "wxyz"]
  
  charmap[digit.to_i].chars
end
