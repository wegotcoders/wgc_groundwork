class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    require 'prime'

def self.sum_to(n)
#This is used to calculate the sum of the selected prime numbers
   (2..n/2).none?{ |x| n % x == 0 }
end

primes = []
#This is used to select what range of prime numbers will be sum'ed, and then displays it. The '...' excludes the maximum range (e.g 1000)
for i in 2...1000
   primes.push(i) if self.sum_to(i)
end
#This prints out the Sum of the selected rage of prime numbers.
primes.inject(:+)

#NOTE: If you refresh the page too many times after clicking on the link to the prime numbers page, or select back and click on it again; the Sum will be declared 'false'. I have yet to find out the solution to this.

  end
end
