# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.

# The product 7254 is unusual, as the identity, 39 × 186 = 7254, 
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.

# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.

class Pandigital
  # identity (combination of multipliers and product) must be 9 digits
  IDENTITY_LENGTH = 9
  # total length of multipliers must be 5 for a total length of 9 digits (figured out through trial and error)
  MULTIPLIERS_LENGTH = 5
  def self.calculate
    sum = 0
    product_array = []
    product = 0
    (1..2000).each do |first_num|
      (1..2000).each do |second_num|
        if (first_num.to_s + second_num.to_s).length == MULTIPLIERS_LENGTH
          product = first_num * second_num
          # create a string and append the numbers (as strings) to it
          digit_string = product.to_s
          digit_string << first_num.to_s
          digit_string << second_num.to_s
          # create an array of the digits
          digits = digit_string.split("")
          # if the number is pandigital & the product isn't already there & doesn't include 0 (only digits 1-9)
          if digits == digits.uniq && digits.length == IDENTITY_LENGTH && !product_array.include?(product) && !digits.include?('0')
            # add the product to the array to keep track of what's been added
            product_array.push(product)
            # and add the product to the sum
            sum += product
          end
        end
      end
    end
    sum
  end
end

