class Primes

  def self.sum_to(limit = 100)
    primeTotal = 0

  	for numberRange in 2...limit
      if isPrime(numberRange) == true
        primeTotal += numberRange
      end
  	end
  	return primeTotal
  end

  def self.isPrime(a)
   prime = false
   test = 0
   for i in 2..Math.sqrt(a)
    if a == 2
      next
    end
        if a % i == 0
          test += 1
        end
    end
    if test == 0
      prime = true
    end
    return prime
  end

end