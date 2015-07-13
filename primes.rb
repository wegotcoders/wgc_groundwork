
=begin

Bit lost on this at the moment, I understand what I need to do but cant seem to get it working. I am creating the $factor array
and pushing in the square root of 2..limit and then removing any duplicates. This is to make the program more effecient incase 
you want to find the sum of primes up to say 1,000,000 it would saving running through each number.

From there I know I need to them basically just check limit.each % each of the array numbers to see if they equal 0 to rule them out
as not prime, but seem to be brain farting it atm.

I am aware there is a prime gem I could use, but seems to defeat the purpose of the exercise.

=end

class Primes

	$factor = Array.new
	$count = 0
	$prime = false

	def self.sum_to(limit)
		
		(2..limit).each do |i|

  		$factor << Math.sqrt(i).to_i
  		$factor = $factor.uniq
		end

		$factor.each do |i|
			
			(2...limit).each do |x|
				if x % i != 0 && x != i
					puts x
				end
			end

		end


	
		# puts $factor.inspect
		# puts $count

	end

end
 

Primes.sum_to(100)