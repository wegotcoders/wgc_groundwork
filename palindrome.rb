# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

class Palindrome
  def self.calculate
    largest_palindrome = 0
    (100..999).each do |first_num|
      (100..999).each do |second_num|
        product = (first_num * second_num).to_s
        if product == product.reverse
          largest_palindrome = product.to_i if product.to_i > largest_palindrome
        end
      end
    end
    largest_palindrome
  end 
end

