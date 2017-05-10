Move = 
  Struct.new(:disk, :from, :to) do
    def inspect
      "{💿 #{disk}} #{from} -> #{to}"
    end
  end

def hanoi(n, from = 0, to = 2)
  # This method moves n disks (stacked in ascending order) from the
  # 'from' peg to the 'to' peg, using a single spare peg.
  # It obeys the rules:
  # - Only move one disk at a time
  # - Only move top disks
  # - A disk can only be placed on a larger disk, or an empty space
  return [Move.new(n, from, to)] if n == 1
  
  spare = find_spare_peg(from, to)
  moves = []
  moves += hanoi(n - 1, from, spare)
  moves << Move.new(n, from, to)
  moves += hanoi(n - 1, spare, to)
end

def find_spare_peg(from, to) # returns the spare peg given from, to
  ([*0..2] - [from, to]).first
end

hanoi(3).each do |move|
  puts move.inspect
end

# Sample output:
# 
# {💿 1} 0 -> 2
# {💿 2} 0 -> 1
# {💿 1} 2 -> 1
# {💿 3} 0 -> 2
# {💿 1} 1 -> 0
# {💿 2} 1 -> 2
# {💿 1} 0 -> 2
