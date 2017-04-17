# A word is considered elfish if it contains the letters: e, l, 
# and f in it, in any order. For example, we would say that the
# following words are elfish: whiteleaf, tasteful, unfriendly,
# and waffles, because they each contain those letters.
# 
# • Write a predicate function called elfish? that, given a word,
# tells us if that word is elfish or not.
# 
# • Write a more generalized predicate function called x-ish? 
# that, given two words, returns true if all the letters of the
# first word are contained in the second.
def xish?(word, rem="elf")
  return rem.empty? if word.length == 0
  
  # top down
  c = word.chr
  new_rem = rem.chars.reject {|s| c == s}.join("")
  
  # bottom up
  xish?(word[1, word.length], new_rem)
end
# pp xish? "whiteleaf"
