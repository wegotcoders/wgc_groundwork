require "prime"
class Primes
  def self.sum_to(limit = 100)
	  list_of_primes = []
	  Prime.each(limit) { |prime| list_of_primes << prime }
	  return list_of_primes.inject{|sum, x| sum + x}
  end
end
