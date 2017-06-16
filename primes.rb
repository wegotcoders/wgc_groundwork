require 'prime'

class Primes
  def self.sum_to(num)
    Prime.each(num).inject(&:+)
  end
end

puts Primes.sum_to 100
    
    #class Primes
     # def self.sum_to(limit = 100)
      #  # TODO - add your prime number solution here...
       # "I'm working on it!"
    #  end
    #end