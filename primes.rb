class Primes
  def self.sum_to(value = 100)
  primes = []
    for num in 2..value
   	  primes[num] = true
    end

  limit = Math.sqrt(value)

    for i in 2..limit
        if primes[i] == true 
      	  j = i * i
      	  while j <= value
      	  	primes[j] = false
      	  	j = j + i      	   
      	  end
       end
    end
	total = 0
    for i in 2..value
      if primes[i] == true
        total = total + i
      end
    end
    return total
  end
end
