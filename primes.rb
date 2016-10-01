class Primes
  def self.sum_to(limit)
    # TODO - add your prime number solution here... 
    require 'prime'
    return Prime.each(limit).inject(0, :+)
  end
end
