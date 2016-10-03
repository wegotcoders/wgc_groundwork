class Primes
  def self.primes_array(maxN)			# very easy to implement at this point
  	results = []

	(1..maxN).each do |i|
		results.push(i) if (self.prime?(i))
	end

	return results
  end




  def self.prime?(n)

  	case n
		when 0					# 0 is not a prime
			return false
		when 1 					# 1 will always be prime
			return false
		when 2					# 2 is also a prime, but I need this for the logic (it can't start with 2)
			return true
		else
			(2..(n-1)).each do |i|		# for given number (0,1 & 2 will not end up here), we take every precedent number counting from 2
				return false if (n % i)	== 	0		# if we find a divisor we exit the method with false
				end	
			#
			return true					# if no divisor has been found, n is a prime
		end
  end




  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    # require 'prime'
    limit = limit.abs

	total = 0

	(1..limit).each do |i|
		break if ((total + i) > limit)  
		# total += i if (Prime.prime?(i))
		total += i if (self.prime?(i))
	end
	
	return total

  end
end


