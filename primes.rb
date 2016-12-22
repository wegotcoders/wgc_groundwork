class Primes
  def self.sum_to(limit = 100)
    sum = 0 #output sum of primes
    numbers = (2..limit).to_a #all numbers till given limit

    for number in numbers
    	numbers = numbers.select{ |value| value % number != 0 || value == number }
    end

    numbers.each do |val|
    	sum += val
    end
    sum
  end
end

puts Primes.sum_to(2000000)