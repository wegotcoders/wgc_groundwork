require 'prime'

class Primes
  
  @sum=0
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
	
	Prime.each(limit) do |x|
		 @sum+=x
	end
  	#puts "@{sum}"
  end 

 end


@test = Primes.sum_to

puts @test








