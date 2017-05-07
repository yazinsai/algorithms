require "benchmark"

# Checks for clashes between two timelines; working
def clash_check(a, b)
	clashes = []
  a.each do |a_start, a_finish|
    range_a = a_start..a_finish

    # check against each of b's slots
    b.each do |b_start, b_finish|
      range_b = b_start..b_finish
      
      # detect overlap of ranges
      # if Rails: range_a.overlaps?(range_b)
      if range_a.cover?(range_b.first) || range_b.cover?(range_a.first) 
				clashes << [range_a, range_b]
      end
    end
  end
  clashes.empty?
end

a = [[660, 710], [720, 820], [500, 520], [3360, 3410]] # PHYCS/X
b = [[480, 530], [3360, 3410], [6240, 6290]] # MATHS101/1
iterations = 100_000

`reset`
Benchmark.bm do |x|
  x.report('2nest') { iterations.times { clash_check(a, b) } }
end

exit 0
