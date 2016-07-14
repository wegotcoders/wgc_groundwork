class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    primes = (2..limit).select do |n|
    	(2..Math.sqrt(n)).none? do |i|
    		(n%i).zero?
    	end
    end

    	sum = primes.inject { |sum, i| sum + i }
	end
end

Primes.sum_to(100)
Primes.sum_to(1000)
Primes.sum_to(10000)

#puts Primes.sum_to(2000000)
#commented out the 2 million soloution as it takes a while to run but it does work


