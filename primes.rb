#Works on my computer fine, but on the website it seems to be adding multiples of @sum and I can figure out why atm.
#Tried to make this OOP...



class Primes

	@factor = Array.new
	@primes = Array.new
	@sum = 0

# Determine the factors of limit to make program more efficient 
	def self.factor(limit)

		(2..limit).each do |i|

	  		@factor << Math.sqrt(i).to_i
	  		@factor = @factor.uniq
	  			  		
	  	end
	  	@factor.delete(1)


	end

# Remove even numbers
	def self.evens(limit)
		@primes << 2

		(2..limit).each do |i|
			if i % 2 != 0
				@primes << i
			end
		end	

	end


# Iterate through to remove non prime numbers
	def self.getPrime(limit)

		@factor.each do |i|
			@primes.each do |x|
				if x % i == 0 && x != i 
					@primes.delete(x)
				end
			end
		end

	end

# Add up prime numbers left in the array
	def self.addPrime(limit)
		@sum = 0

		@primes.each { |x| @sum += x}
		
	end

  	def self.sum_to(limit = 100)

  		factor(limit)
  		evens(limit)
  		getPrime(limit)
  		addPrime(limit)
  		puts @sum
  		return @sum



	end

end

Primes.sum_to