class Primes

  def self.sum_to(limit = 100)

  	#Using sieve of eratosthenes to find sum of primes to limit

  	#Set up array from 0 to limit
    primes = (0..limit).to_a
    #Set 0 and 1 to nil because they are not primes
    primes[0] = primes[1] = nil

    #Go through prime candidates
    primes.each do |p|
      #Go past if nil
      next unless p
      #Break if past square root of limit
      break if p*p > limit
      #Start at square of current, step through, go up to limit by multiples of current number, make each nil
      (p*p).step(limit,p) { |m| primes[m] = nil }
    end

    #Remove nils
    sum = primes.compact
    #Sum of each prime in array
    sum.inject(:+)

  end

end