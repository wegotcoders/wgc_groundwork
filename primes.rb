class Primes
  def self.sum_to(limit = 100)
    total = 0;
    (2..limit).each { |n| total+=n if is_p? n }
    return total;
  end

  # this method is to check if a given number can be devided 
  # by any number that came before it.
  # (technically, it just tells you if a given number is prime)
  def self.is_p?(p)
    (2...p).each { |n| return false if p % n == 0 };
    return true;
  end

end