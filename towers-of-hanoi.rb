# Excellent explanation of the solution at 
# http://www.mathcs.emory.edu/~cheung/Courses/170/Syllabus/13/hanoi.html

Move = 
  Struct.new(:disk, :from, :to) do
    def to_s
      "Disk #{disk}: #{from} -> #{to}"
    end
  end

def spare_peg(from, to)
  # returns the peg that is not 'from' nor 'to'
  # e.g. if from="A", to="C" ... then spare="B"
  ("A".."C").detect{ |peg| ![from, to].include?(peg) }
end

def hanoi(num_disks, from, to)
  if num_disks == 1 # base case
    return [Move.new(num_disks, from, to)]
  end
  
  spare = spare_peg(from, to)
  moves = hanoi(num_disks - 1, from, spare) # move everything to the spare peg
  moves << Move.new(num_disks, from, to) # move the sole remaining disk to the 'to' peg
  moves += hanoi(num_disks - 1, spare, to) # move disks back on top of the 'to' peg
end

# Example run with 3 disks to be moved from A to B
puts hanoi(3, "A", "B").each {|m| m.to_s}
