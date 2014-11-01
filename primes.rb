class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    Prime.each(limit) do |i|
    		 @sum += i
    		 puts "@{sum}"
    end
end
end
