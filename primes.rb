class Primes
  def self.sum_to(limit = 2000000)
    require 'prime'

	total = 0

	Prime.each(limit) do |prime|
		total += prime
	end

	return total

  end
end