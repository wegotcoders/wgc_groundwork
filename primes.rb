class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
	  require 'prime'
first_array = Prime.take_while{|p| p < 100}
sum_count = prime_array.inject{|sum,items| sum + items}
p sum_count
  end
end