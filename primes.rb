class Primes
  def self.sum_to(limit = 100)
    (1..limit).select{|i| Prime.prime?(i)}
  end
end