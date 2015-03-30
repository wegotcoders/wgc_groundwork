
class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    require 'prime'

    total = 0

    Prime.each(limit) do |prime|
        total += prime
    end

    return total
  end
end

