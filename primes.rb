require 'prime'

class Primes
  def self.sum_to(limit = 100)
    puts Prime.each(limit).reduce(:+)
  end
end

self
