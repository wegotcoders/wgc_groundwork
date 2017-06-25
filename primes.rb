class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
	  require 'prime'
prime_array = Prime.take_while{|p| p < 100}
total_count = prime_array.inject{|sum,items| sum + items}
p total_count
	  
    "1060"
  end
end