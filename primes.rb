require 'prime'
class Primes
  def self.sum_to(limit = 100)
  	(0..limit).select { |number| number.prime? }.reduce(:+) || 0
  end
end