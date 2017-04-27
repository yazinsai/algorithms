=begin
Given a 2D board and a word, find if the word exists in the grid.

The word can be constructed from letters of sequentially adjacent cell,
where "adjacent" cells are those horizontally or vertically neighboring. 
The same letter cell may not be used more than once.

For example,
Given board =

[
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']
]
word = "ABCCED", -> returns true,
word = "SEE", -> returns true,
word = "ABCB", -> returns false.

Source: https://leetcode.com/problems/word-search/
=end

def exist(board, word)
  # find letter occurrences in grid
  found = false
  find_index(board, word.chr).each do |pos|
    found ||= helper(board, word[1..-1], [pos])
  end
  found
end

# recursive method to search the board looking for the word
# while passing the previous position to ensure we don't
# use the same letter more than once
def helper(board, word, visited=[[]])
  return true if word.empty?
  
  matches = search_adjacent(board, word[0], visited)
  return false if matches.empty?
  
  matches.any? {|position| helper(board, word[1..-1], 
    visited + [position])}
end

# searches the adjacent cells on the board looking for the
# next letter, while avoiding 'visited' cells
def search_adjacent(board, letter, visited)
  start = visited.last
  matches = []
  
  # iterate over adjacent cells
  [[0, 1], [0, -1], [1, 0], [-1, 0]].each do |move|
    next_cell = pairwise_sum(start, move)
    if on?(board, next_cell) && 
      !visited.include?(next_cell) &&
        board[next_cell[0]][next_cell[1]] == letter
        # next cell matches
        matches << next_cell
    end
  end
  
  matches
end

# helper method to find all indices of the character char 
# in the board
def find_index(board, char)
  found = []
  board.each_with_index {|row, i| 
    row.each_with_index {|col, j| 
      found << [i, j] if col == char }}
  found
end
  
def pairwise_sum(a, b)
  [a, b].transpose.map {|x| x.reduce(:+)}
end

# is the position that is passed actually on the board?
def on?(board, position)
  position[0].between?(0, board.length - 1) && 
    position[1].between?(0, board[0].length - 1)
end

board = [
  ['A','B','C','E'],
  ['S','F','C','S'],
  ['A','D','E','E']]

puts exist(board, "ABA").inspect
