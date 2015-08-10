require 'prime'

class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    Prime.each(100).reduce(:+)
    
  end
end