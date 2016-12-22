class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...    
    count = 2
    sum = 0
    until count > limit do 
      prime = has_prime?(count)
    	sum += prime
      count += 1
    end
    return sum
  end

  def self.has_prime?(num)
		count = 2
		until count > (num/2)
			if num % count == 0
				return 0
			end
	    count+=1
		end
		return num
	end
end