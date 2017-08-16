require "prime"
class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...)
	sum = 0
	for i in 1..limit
		sum += i if Prime.prime?(i)
	end
	sum
end
end