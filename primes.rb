class Primes
  def self.sum_to(limit = 100)
    nums = Array.new
	i = 2
	sum = 0

	while i <= limit do
      nums.push(i)
      if (i%2 == 0 && i*2 != 4)
        nums.delete(i)
      end
      if (i%3 == 0 && i*3 != 9)
        nums.delete(i)
      end
      if (i%5 == 0 && i*5 != 25)
        nums.delete(i)
      end
      if (i%7 == 0 && i*7 != 49)
        nums.delete(i)
      end
      if (i%11 == 0 && i*11 != 121)
        nums.delete(i)
      end
      i += 1
	end
	
	for number in nums
	  sum += number
	end
    
	return sum
	
  end
end