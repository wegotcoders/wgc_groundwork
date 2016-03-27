class Primes
  def self.sum_to(limit = 100)
    sum = 0
		for i in (2..limit)
		  prime = true
		  for j in (2...i)
		  	if i % j == 0
		  		prime = false
		  	end
		  end
		  sum += i if prime
		end
		return sum
  end
end