# THE EASY (AND FAST) WAY:

require 'prime'

class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    Prime.each(limit).reduce do |sum, prime|
    	sum + prime
  	end
  end
end

# THE DIFFICULT (AND SLOW) WAY:

# class Primes
#   def self.sum_to(limit = 100)
#     sum = 0
#     for num in 2..limit                   # iterate through each number up to the to set limit
#       is_prime = true                     # set is_prime as true by default
#       if num.even? && num != 2            # If the number is even (and not 2), don't bother testing it
#         is_prime = false
#         next
#       else
#         for divider in 2..Math.sqrt(num)  # iterate through each number that it could divide by
#           if num % divider == 0           # if there is no remainder then the number isn't prime
#             is_prime = false              # so set is_prime boolean to false
#             break                         # and break out of the loop
#           else
#             next                          # otherwise, try the next possible dividing number
#           end
#         end
#       end
#       if is_prime == true                 # if is_prime is still true then it's prime
#         sum += num                        # so add it to the total                           
#       end
#     end
#     return sum                
#   end
# end

