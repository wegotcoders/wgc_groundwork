class Primes
  def self.sum_to(limit = 100)
    total = 0
    n = 2
    while n < limit do
      if self.is_Prime(n) then
        total += n
        #puts "#{n}, #{total}"
      else
      end
      n += 1
    end
    return total

  end

  def self.is_Prime(n)
    d = 2 
    # we only need to check divisors up to sqrt(n)
    while d **2 <= n do
      if n % d == 0 then
        return false
      else
        d += 1;
      end
    end
    return true
  end
end

