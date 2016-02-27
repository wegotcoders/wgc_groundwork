class Primes
  def self.sum_to(limit)
      require 'prime'
      Prime.each(limit).inject(:+)
  end
end