Line = Struct.new :slope, :y_intercept

def intersect?(l1, l2)
  # solve for x, if you can
  begin
    x = (l2.y_intercept - l1.y_intercept) / 
          (l1.slope - l2.slope) 
    true # they intersect
  
  rescue 
    return false # they don't
  end
end

puts intersect(Line.new(10, -100), Line.new(1, 0)).inspect
