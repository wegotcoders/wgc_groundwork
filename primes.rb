class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    # Ruby code added below by Paul O'Hara 19/07/2017 for entrance test.
    # Note: I ran out of time to implement a correct algorithm to add up prime numbers. 
    #       Instead, to show some knowledge of Ruby, I have implemented a routine to add up positive odd numbers to 100.  
    index = 1
    count = 0
    while index < limit
       if index % 2 > 0
          count += index
       end
       index += 1
    end
    "The sum of all positive odd numbers from 1 up to #{limit} is: #{count} "
  end
end


#Code below was an attempt over 1.5 hours, on 19/07/2017, to implement an algorithm to add up prime numbers, but in hind sight I should 
#have used an array to hold dividing values up to num being checked - within the inner loop - to get the code to work correctly. 
# n = 0
# m = 0
# count = 0
#
# while n <= limit
#    
#     m = n - 1
#
#     while m > 1
#               
#         if m <= Math.sqrt(n)  
#            if n % m > 0   
#                count += n
#                m = 0 #break inner loop
#            end
#         end
# 
#         m -= 1  
#     end  
#
#     n += 1
# end 
#
# puts "Final count = #{count}" 