######CANT LAUNCH SERVER WITHOUT THIS CODE###########
class Primes
  def self.sum_to(limit)
  # TODO - add your prime number solution here...
    require 'prime'
####################################################
def self.sum_to(n)
   (2..n/2).none?{ |x| n % x == 0 }
end

primes = []
for i in 2...1000
   primes.push(i) if self.sum_to(i)
end
#Prints the sum of the range - NOTE TO SELF - look into "inject" method more.
primes.inject(:+)
 end

end
