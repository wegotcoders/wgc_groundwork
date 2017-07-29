class Primes
  def self.sum_to(limit = 20)
    # TODO - add your prime number solution here...
    # Ruby code added below by Paul O'Hara 01/07/2017 post "We got coders" entrance test.
    # Code below was a third attempt at an algorithm to add up prime numbers. I decided that a pure algorithm approach 
    # would never work, and that a more precise mathematical formula - as part of my own algorithm - was needed. My first 
    # year university maths was now rusty, so I turned to wikipedia for a formula that would work (not a trusted academic 
    # source, but still useful in its own right). The algorithm below contains pseudo code from the following web source: 
    # https://en.wikipedia.org/wiki/Primality_test.
    #
    # The pseudo code from the above wiki source is as follows:
    #     
    #   function is_prime(n)
    #   if n ≤ 1
    #       return false
    #   else if n ≤ 3
    #       return true
    #   else if n mod 2 = 0 or n mod 3 = 0
    #      return false
    #   let i ← 5
    #   while i * i ≤ n
    #       if n mod i = 0 or n mod (i + 2) = 0
    #           return false
    #       i ← i + 6
    #   return true
    #
    # Hence, the ruby algorithm below implements this formula to identify and add up prime numbers - to the value determined by var limit.
    #
    count = 0
    num_to_check = 0

    while num_to_check <= 20
        
        is_prime = true

        if num_to_check <= 1
            is_prime = false
        elsif num_to_check <= 3 
             is_prime = true
        elsif (((num_to_check % 2 == 0) || (num_to_check % 3 == 0)) )
            is_prime = false
        else 
        	int_var = 5
            while int_var * int_var < num_to_check
               if ((num_to_check % int_var == 0) || (num_to_check % (int_var + 2) == 0))
                   is_prime = false
               end
               num_to_check += 6
            end
        end
     
        if is_prime
            count += num_to_check
        end

        num_to_check += 1
    end
    
    return count

  end
end


# Ruby code added below by Paul O'Hara 19/06/2017 for entrance test.
# Note: I ran out of time to implement a correct algorithm to add up prime numbers. 
#       Instead, to show some knowledge of Ruby, I have implemented a routine to add up positive odd numbers to 100.  
#index = 1
#count = 0
#while index < limit
#   if index % 2 > 0
#      count += index
#   end
#   index += 1
#end

#Code below was an attempt over 1.5 hours, on 19/06/2017, to implement an algorithm to add up prime numbers, but in hind sight I should 
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