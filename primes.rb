class Primes

def self.isprime(n)

  is_prime = true
  
  for i in 2..n-1
    if n % i == 0
      is_prime = false
  	end
  end
  
 	if is_prime == true
    	return true
  	else
    	return false
  	end
  
  end

  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
	sum = 0
	num = 2
    while num < limit
    	
    	if isprime(num)==true
	    	sum+=num 
	    end
    num += 1
    end
    return sum
  end
  
 
end
