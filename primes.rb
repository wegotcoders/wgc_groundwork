class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    
    sum=0
    primes=[]
    
    case limit
    when 1
    	return 0
    when 2 
    	return 2
    end

    (3..limit).step(2).each do |n|
    	
    	if primes[n].nil?

    		(3 * n..limit).step(n).each do |i|
    			primes[i]=true
    		end
    	sum += n
    	end

    end
    		    	
    return sum + 2 
  end

end