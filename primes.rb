
#!Todo Fix code, construct class properly!


class Primes
	def self.sum_to(limit = 100)
		# TODO - add your prime number solution here...
 
limit =100

     answer =  Prime.each(limit).reduce(:+)
 
return answer


	end 
end






__END__






#Tried this first, wasnt supplying the required data in the determined way :/


require 'prime'
limit=100
array_of_primes = []
start_time = Time.now
(1..limit).each do |n|
	if Prime.prime?(n)
		array_of_primes << n
	end
end

answer = array_of_primes.inject(:+)

duration = Time.now - start_time #poor mans benchmarking- must look into rspec!

puts "Sum of primes below 100 is #{answer}.It took #{duration} s to calculate using the Prime.prime? method."


=============================

class Primes
	def self.sum_to(limit = 100)
		# TODO - add your prime number solution here...
     answer =  Prime.each(limit).reduce(:+)

	end 
end



