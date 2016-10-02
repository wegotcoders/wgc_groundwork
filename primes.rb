class Primes
  def self.sum_to(limit)
    # TODO - add your prime number solution here... 
    require 'prime'
    return Prime.each(limit).inject(0, :+)
  end
end


# working on the solution how to make this code work in app
=begin
class Puzzle
  def mult()
  (1...1000).select do |x|
    x % 3 == 0 || x % 5 == 0
    end
  end
  def self.sum_mult(mult)
  add = mult.inject(&:+)
  end 
end
=end
