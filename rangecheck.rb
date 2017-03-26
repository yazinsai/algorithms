# Checks for clashes between two timelines; working

a = [[660, 710], [720, 820], [500, 520], [3360, 3410]] # PHYCS/X
b = [[480, 530], [3360, 3410], [6240, 6290]] # MATHS101/1

clashed = :false

a.each do |a_start, a_finish|
  range_a = a_start..a_finish

  # check against each of b's slots
  b.each do |b_start, b_finish|
    range_b = b_start..b_finish
    
    # detect overlap of ranges
    # if Rails: range_a.overlaps?(range_b)
    if range_a.cover?(range_b.first) || range_b.cover?(range_a.first) 
      clash = :true
      puts "Clash detected between #{range_a} and #{range_b}"
    end
  end
end

puts "No clash detected" unless clashed
exit 0
