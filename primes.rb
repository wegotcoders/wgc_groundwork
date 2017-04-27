require 'prime'
class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    "Different words to see what is going on."
    #
    n = 0
    Prime.each(limit) do |prime|
    	n += prime
    end
    p n
end
end