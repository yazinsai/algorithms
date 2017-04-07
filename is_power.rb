# given 4, find if the number can be expressed a^p
def is_power(a)
  # linear --> O(n)
	return 1 if a == 1 # 1^1 = 1
        
	for i in 2..a
		div = Math.log(a) / Math.log(i)
		rem = div - div.to_i
		
		return 1 if rem < 0.0000000001 && div > 1
		# use small decimal value to get over floating point woes
	end
	
	0 # otherwise, nothing
end

n = 2**5
puts "find_power(#{n}) = #{is_power(n).inspect}"
  
