class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    "I'm working on it!"
    return 0 if limit==1 || limit==0
    return 'The number should be positive' if limit<0
    sum=0
    (2..limit-1).each do |x|
    	prime=true;
        #puts x
    	(2..Math.sqrt(x.floor)).each do |y|
			#puts 'x is  ' + x.to_s + 'y is  ' + y.to_s
    		if x%y==0
                prime=false
    			break
    		end
        end
    	sum+=x if prime==true
    end
    sum
  end

end