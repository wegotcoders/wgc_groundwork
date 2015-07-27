#Works on my computer fine, but on the website it seems to be adding multiples of @sum and I can figure out why atm.
#Tried to make this OOP...



class Primes

# Initialize all the variables, also used to reset variable for each calculation
	def self.initialize
		@factor = Array.new
		@primes = Array.new
		@sum = 0

	end
	

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
	def self.getPrime

		@factor.each do |i|
			@primes.each do |x|
				if x % i == 0 && x != i 
					@primes.delete(x)
				end
			end
		end
	end

# Add up prime numbers left in the array
	def self.addPrime
		@sum = 0

		@primes.each { |x| @sum += x}	
	end

  	def self.sum_to(limit = 100)

  		initialize
  		factor(limit)
  		evens(limit)
  		getPrime
  		addPrime
  		return @sum

	end

	def self.primeFactor(number)
		initialize
		factor(number)
		evens(number)
		getPrime
		maxPrime(number)
		puts @i

	end

	def self.maxPrime(number)
		@i = 0
		@primes.each do |x|
			if number % x == 0 && x > @i 
			@i = x
			end
			
		end

	end

end

Primes.sum_to
Primes.primeFactor(600851475143)