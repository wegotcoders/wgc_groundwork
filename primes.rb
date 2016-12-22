require 'prime'

class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    #"I'm working on it!"
    sum = 0
    "limit must be an integer" unless limit.is_a? Integer 
    "limit must be greater than 0" if limit <= 0
    Prime.each(limit) {|prime| sum += prime}
    sum
  end
  def self.prime_factors(number = 100)
  	array = Prime.prime_division(number)
  	factors = []
  	array.each { |sub_array| factors.push(sub_array[0]) }
  	factors
  end

  def self.largest_prime_factor(number = 100)
  	array = prime_factors(number)
  	largest_factor = 1
  	array.each do |num|
  		largest_factor = num if num > largest_factor
  	end
  	largest_factor
  end
end