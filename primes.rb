class Primes
  def self.sum_to(limit = 100)
#----------------------------------------
	#--There's a built in class for this but I'm guessing that's not what you're after
	 # require 'prime'
	 # built_arr = Prime.take_while {|n| n <= limit }
	#----------------------------------------

	#----------------------------------------
	# Aimed for tradeoff of code simplicity and computational efficiency. 
	# Could have done it in less code but couldn't have taken advantage of properties such as being able to begin each inner loop from the x^2 instead of 2x.
	# Altering array in place as opposed to pushing to new array probably saves operations as the single compact! will be well optimised.
	#----------------------------------------

	arr=(2...limit).to_a 
    (limit**0.5).ceil.times { |x|
    	x+=2
        i=x**2
        until i > limit
            arr[i-2] = nil
            i+=x
        end
    }
    arr.compact!

     # puts "#{arr.length} primes up to #{limit}"
     # # print arr
     # puts "and the pros say #{built_arr.length}"

  end
end