class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    require 'prime'

	total = 1

	(1..limit).each do |i|
		break if ((total + i) > limit)  
		total += i if (Prime.prime?(i))
	end
	
	return total

  end
end