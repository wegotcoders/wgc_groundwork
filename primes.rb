# 142913828922 is the answer

class Primes
  def self.sum_to(n = 100)
	primes = Array.new
	for i in 2...n
		primes[i-2] = i
	end
	index = 0
	last = primes.last
	while primes[index]**2 <= last
		j = primes[index]
		primes = primes.select {|x| x == j || x%j != 0}
		index += 1
	end
	  sum = 0; primes.each { |x| sum += x }; 
	  return sum
  end
end

puts Primes.sum_to(2000000)
