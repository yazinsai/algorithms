def subsets(nums)
  list = []
  list, _ = backtrack(list, [], nums, 0)
  list
end
  
def backtrack(list, temp_list, nums, start)
  puts "\nbacktrack(last=#{list.last}, temp_list=#{temp_list.inspect}, start=#{start})"
  list += [temp_list]
  for i in start...nums.length
    temp_list += [nums[i]]
    puts "  #{start}.temp(before): #{temp_list.inspect}"
    list, temp_list = backtrack(list, temp_list, nums, i + 1)
    temp_list = temp_list[0..-2] # immutably delete last element
    puts "  #{start}.temp(after): #{temp_list.inspect}"
  end
  [list, temp_list]
end

puts subsets([1, 2, 3]).inspect
