class Primes
  require 'prime'
  def self.sum_to(limit = 100)
    sum = 0
    Prime.each(limit) do |prime|
      sum+=prime
    end
    return sum
  end
  
end