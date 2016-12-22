class Primes
	def self.sum_to(n = 100)
	    #Pseudocode from wikipage of Sieve of Eratosthenes  

	    list = [*2..n] 
	    p = 2 

	    loop do

	        i = p 

	        until p >= n 
	            p += i
	            list.delete(p) 
	        end

	        if list.find{ |x| x > i }
	            p = list.find{ |x| x > i } 

	        else
	        	total = 0
	        	list.each{ |x| total += x }

	            return total

	        end
	    end
	end
	    
end

