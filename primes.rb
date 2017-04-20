require 'prime'
class Primes
  def self.sum_to(limit = 100)
    total = 0
    primeSum = []
    # TODO - add your prime number solution here...
    (2..limit).each do |i|
      if Prime.prime?(i)
        primeSum.push(i)
        total += i
      end
    end
      return total
end
end
