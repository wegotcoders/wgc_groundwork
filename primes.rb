class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    sum = 0
    #Save all numbers into an array first.
    prime_numbers = Array.new
    for number in 2..limit
    	prime_numbers[number-2] = i
    end

    #Loop through the Array...
    counter = 0

    while prime_numbers[counter] <= prime_numbers.last #Not sure about this...
    	prime = prime_numbers[counter]
    	# prime number is only dividable by itself and 1. 
    	#So modulo needs to be not 0, or value must be equal to the number...
    	primes = prime_numbers.select{ |value| value % prime != 0 || value == prime }
    	counter += 1
    end
    primes.each do |val|
    	sum += val
    end
    return sum
end

puts Primes.sum_to(2000000)