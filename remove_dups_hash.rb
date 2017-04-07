require 'set'

def remove_duplicates(a)
  # convert array to hash and back
  a.to_set.to_a
end

puts remove_duplicates([0, 1, 1, 1, 2, 3, 4, 4, 5, 10]).inspect
