class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...    
    i = 2
    sum = 0
    until i > limit do 
      j = has_prime?(i)
    	sum += j
      i += 1
    end
    return sum
  end

  def self.has_prime?(num)
		i = 2
		until i > (num/2)
			if num % i == 0
				return 0
			end
	    i+=1
		end
		return num
	end
end