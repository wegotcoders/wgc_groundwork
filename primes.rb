include Math

class Primes


# function returns true if prime, false if not


  def self.sum_to(limit)
	sum=0
	for i in 1..limit
		# puts "#{i}  "
		v = is_prime(i)
		if v		
			sum += i
		end
	end
	sum
  end


  def self.is_prime(number) 
  	## improvement for future - to make efficient
  	## - - - - - - - - - exclude testing all even numbers or (more generally) multiples of excluded factors.
  	## - - - - - - - - - consider using a pre-populated list of prime factors?
  	bool = false
  	if number == 1
  	bool = false
  	else
  	j = 1
	  	loop do
	  		j = j+1
		  		if (j> sqrt(number))
		  			bool = true
		  			break

		  		else
		  		break if (number % j == 0)
		  		end

	  	end
	end

	bool
  end


  def self.count_to(limit)
	count=0
	for i in 1..limit
		# puts "#{i}  "
		v = is_prime(i)
		if v			
			count += 1
		end
	end
	count
  end


end




