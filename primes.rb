class Primes


# function returns true if prime, false if not


  def self.sum_to(limit)
	sum=0
	for i in 1..limit
		# puts "#{i}  "
		v = is_prime(i)
		if v
			# puts "prime!"			
			sum += i
		end
	end
	sum
  end


  def self.is_prime(number) 
  	bool = false
  	if number == 1
  	bool = false
  	else
  	j = 1
	  	loop do
	  		j+=1
	  		if (j> number / 2)
	  			bool = true
	  			break
	  		end
	  		break if (number % j == 0)
	  	end
	end

	bool
  end


  def self.count_to(limit)
	count=0
	for i in 1..limit
		puts "#{i}  "
		v = is_prime(i)
		if v			
			count += 1
		end
	end
	count
  end

end

coun = Primes.count_to(1000)

puts coun



