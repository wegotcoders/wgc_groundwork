# def sum(lim_num=100)
#   total = 0
#   i == 2...lim_num
#   for n in i
#   	total += n unless n % i == 0
#   end
#   return total   	
# end

def sum(lim_num=100)
	nums = [1...lim_num]
	total = 0
	for i in nums
	  nums.each { |x| total += x unless x % nums[i] == 0}
    end
end
