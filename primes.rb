#class Primes
  #def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
	  require 'prime'
prime_array = Prime.take_while{|p| p < 100}
total_count = prime_array.inject{|sum,items| sum + items}
p total_count
	  
	  second_array = Prime.take_while {|q| q < 2000000 }
millions_count = second_array.inject {|amount,digits| amount + digits }
p millions_count
	  
    "The results are 1,060 and 142,913,828,922"
 