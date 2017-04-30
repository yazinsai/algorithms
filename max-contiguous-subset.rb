def max(arr)
  sum = max = 0
  
  i = 0 # start of current subset
  max_i = max_j = 0 # start/end of max subset
  
  arr.length.times do |n|
    if arr[n] > 0
      sum += arr[n]
      if sum > max
        max = sum
        max_i, max_j = i, n
      end
    else
      # -ve
      sum = 0
      i = n + 1
    end
  end
  
  return [] if i.zero? && j.zero?
  arr[max_i..max_j]
end

puts max([-1, -1, -1, -1, -1]).inspect

