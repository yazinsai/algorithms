Move = 
  Struct.new :disk, :from, :to do
    def to_s
      "Disk #{disk}: #{from} -> #{to}"
    end
  end

def spare_peg(from, to)
  # returns the peg that is not 'from' nor 'to'
  # e.g. if from="A", to="C" ... then spare="B"
  [*"A".."C"].each {|e| return e unless [from, to].include? e}
end

def hanoi(num, from, to)
  if num == 1 # base case
    return [Move.new(num, from, to)]
  end
  
  spare = spare_peg(from, to)
  moves = hanoi(num - 1, from, spare) # move everything to the spare peg
  moves << Move.new(num, from, to) # move the sole remaining disk to the 'to' peg
  moves += hanoi(num - 1, spare, to) # move all the disks on top of the 'to' peg
end

puts hanoi(3, "A", "C").each {|m| m.to_s}
