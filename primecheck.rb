require 'prime'
def prime_sum(limit)
	puts "find sum of all primes up to #{limit}"
	sum = 0
	for i in 1..limit
		sum += i if Prime.prime?(i)
	end
	sum
end
puts prime_sum(2000000)