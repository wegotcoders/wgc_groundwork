class Primes

  def self.isPrimeNumber?(number)
    (2...number).each do |divisor|
      return false if number % divisor == 0
    end

    true
  end

  def self.findPrimes(maximum)
    primes = []

    (2..maximum).each do |number|
      primes << number if self.isPrimeNumber?(number)
    end

    primes
  end
  
  def self.sum_to(limit = 100)
    arrayOfPrimes = findPrimes(limit)

    arrayOfPrimes.inject{|sum,x| sum + x }
  end
end