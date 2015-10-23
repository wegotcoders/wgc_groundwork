class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    total = 0;

    for i in 2..limit
      if isPrime?(i)
        total += i;
      end
    end

    return total
  end

  def self.isPrime?(number)

    for i in 2..number - 1
      if(number % i == 0)
        return false
      end
    end

    return true
  end
end
