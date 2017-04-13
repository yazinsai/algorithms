def search(a, x) # search for x in a[]
  puts "Called search(#{a.inspect}, #{x})"
  return false if a.length == 0

  mid = a.length / 2
  left, right = 0, -1
  if a[mid] == x
    true
  elsif a[mid] <= a[right] # sorted
    if x > a[mid] && x <= a[right]
      search(a.right, x)
    else
      search(a.left, x)
    end
  else # resets after middle
    if x > a[mid] || x <= a[right]
      search(a.right, x)
    else
      search(a.left, x)
    end
  end
end

class Array
  def left
    self[0...(self.length/2)]
  end
  def right
    self[(self.length/2 + 1)..-1]
  end
end

puts search([3, 4, 5, 6, 1, 2], 3).inspect
