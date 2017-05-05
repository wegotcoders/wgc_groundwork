require 'prime'

class Primes
  def self.sum_to(limit = 100)
     
     sum = 0
     Prime.each(100) do |prime|
   		sum = sum + prime 

	 end

     puts sum
   end

   puts sum_to
end 