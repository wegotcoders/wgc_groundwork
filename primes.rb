require 'prime'

class Primes
  def self.sum_to(limit)

    sum = 0

    Prime.each(limit) do |prime|
	  sum += prime
	end

    return sum
  end
end