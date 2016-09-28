class Primes
  def self.sum_to(limit = 100)
  	prime_sum = Prime.each(limit).inject(:+)
  end
end
