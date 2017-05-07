
def ladder_length(begin_word, end_word, word_list)
  
end

def breadth_first(words, begin_word, end_word)
  explored = []
  queue = [] << [begin_word, 0]
  
  while queue.any? do
    word, depth = queue.shift
    return depth if word == end_word
    next if explored.include? word
    
    # find neighbors
    explored << word
    words.length.times do |i|
      if near?(word, words[i]) && !queue.include?(words[i])
        queue << [words[i], depth + 1]
      end
    end
  end
end
  
def near?(word, other)
  dist = 0
  word.chars.each_with_index {|c, i| dist += 1 if c != other[i]}
  dist == 1
end
  
puts breadth_first(["hot","dot","dog","lot","log", "cog"],"hit","cog").inspect
