# Source: https://www.hackerrank.com/challenges/game-of-thrones

def is_palindromable(s)
  # for a string to be a palindrome, all leters must occur in even
  # numbers, except for the one in the middle which could be either
  # even or odd.
  char_freq = Hash.new(0)
  s.chars.each {|c| char_freq[c] += 1}

  num_odds = 0
  char_freq.each do |k, v|
    if v % 2 == 1 # odd
      return false if num_odds >= 1
      num_odds += 1
    end
  end
  true
end

puts is_palindromable("aaabbc").inspect
