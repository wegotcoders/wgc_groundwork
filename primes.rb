class Primes

#----------------------------------------
	#--There's a built in class for this but I'm guessing that's not what you're after
	 # require 'prime'
	 # arr = Prime.take_while {|n| n <= limit }
     # arr.compact.inject{|sum,x| sum + x }
	#----------------------------------------

	#----------------------------------------
	# Aimed for tradeoff of code simplicity and computational efficiency. 
	# Could have done it in less code (e.g. with step) but couldn't have taken advantage of properties such as being able to begin each inner loop from the x^2 instead of 2x.
	# Altering array in place as opposed to pushing to new array probably saves operations as the single compact at the end will likely be well optimised.
	#----------------------------------------
  def self.list_to(limit)
	arr=(2...limit).to_a 
    (limit**0.5).ceil.times { |x|
    	x+=2
        i=x**2
        until i > limit
            arr[i-2] = nil
            i+=x
        end
    }
    arr.compact
  end

  def self.sum_to(limit)
        list_to(limit).inject{|sum,x| sum + x }
  end
   
end

