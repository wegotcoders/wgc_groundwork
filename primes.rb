
class Primes
  def self.sum_to(limit)
  	require 'prime'
  	Prime.each(limit).inject(:+)

  #def self.sum_to(limit)
  #primes = (0..limit).to_a

  #primes[0] = primes[1] = nil

  
  #counter = 0
  	#primes.each do |n|
   
    	#next unless n

    	#break if n*n > limit
    	#counter += 1
    
    	#(n*n).step(limit,p) { |m| primes[m] = nil }
  	#end

  	#primes.compact

  	#@sum=0
  	#primes.each{ |n| @sum+= n}
  #end

#My attempt at getting a more worked out prime but it is not working yet




  end
end

#dynamic version
