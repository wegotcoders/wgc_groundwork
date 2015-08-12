class Primes
  def self.sum_to(limit = 100)
    require 'prime'
    
    total = 0
	
	Prime.each(limit) { |x| total += x }

	return total
    

  end
end