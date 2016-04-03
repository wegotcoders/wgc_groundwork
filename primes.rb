class Primes
  
	require 'prime'

	def self.sum_to(limit = 100)
		sum = 0
		Prime.each(limit) do |prime|
			sum += prime
		end
	end


  #   This is the method I came up with to achieve the same thing
  #   It's slower and for some reason doesn't work in this app,
  #   even though it runs fine in it's own ruby file

	# def prime_range(number)
	# 	sqrt = Math.sqrt(number).to_i
	# 	primes = [2]

	# 	(3..sqrt).step(2) do |i|
	# 		composite = false
	# 		primes.each do |prime|
	# 			if i % prime == 0
	# 				composite = true
	# 				break
	# 			end
	# 		end

	# 		if primes[primes.length - 1] < i && !composite
	# 				primes << i	
	# 		end
	# 	end
	# 	return primes
	# end

 #  def self.sum_to(limit = 100)
 #    return 0 if limit < 2
	# 	sum = 0
	# 	primes = prime_range(limit)
	# 	primes.each do |prime|
	# 		sum += prime
	# 	end
	# 	for i in(primes[primes.length - 1]..limit)
	# 		skip = false
	# 		primes.each do |prime|
	# 			skip = true if i % prime == 0
	# 			break if i % prime == 0         
	# 		end
	# 		sum += i unless skip
	# 	end
	# 	return sum
 #  end

end