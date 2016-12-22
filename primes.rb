require 'prime'

class Primes
  def self.sum_to(limit)
    # TODO - add your prime number solution here...
    primeArray = []
	Prime.each(limit) do |prime|
 		primeArray.push(prime)
	end
	@sum = primeArray.reduce(:+)
  end
end