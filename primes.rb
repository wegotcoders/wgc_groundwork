class Primes
  def self.sum_to(limit)
    # TODO - add your prime number solution here...
    "I'm working on it!"
    sum  = 0;
    for  i in 2..limit
       isNotPrime =  true
    	for j in 2..i 
    	
           if i%j==0 && i!=j
           	    isNotPrime = false
         
              end
          end
          if isNotPrime == true
            sum= sum+ i
          end
      end
      puts sum
     return sum
    	

      





  end
end