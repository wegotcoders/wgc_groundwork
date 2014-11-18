class Primes
def self.sum_to(limit = 100)
	total == 0
 for i in 2...limit
 	i.each{|prm| total+=prm unless prm%i==0}
 end
 return total
end
end