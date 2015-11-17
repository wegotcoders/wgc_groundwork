require 'prime'

class Primes
  def self.sum_to(limit = 100)

    sum = 0

    Prime.each(100) do |prime|
	  sum += prime
	end

    return sum
  end
end