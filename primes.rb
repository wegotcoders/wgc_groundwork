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
end