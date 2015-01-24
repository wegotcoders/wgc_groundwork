class Primes
  def self.sum_to(limit = 100)
 
require 'mathn'

sum = 0
Prime.each { |x| 
  break if x >= limit;
  sum+=x
}
sum
  end
end