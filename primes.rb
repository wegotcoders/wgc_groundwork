class Primes
  def self.sum_to(limit = 100)
     sum = 0
  (3..limit).each do |val|
            if val.even? then next end
            if is_prime?(val) then sum += val end
          end
  sum +=2
  return sum
  end

  def self.is_prime?(number)
    range=(3..Math::sqrt(number))
    range.step(2) {|val| return false if (number % val == 0)}
    return true
  end
end
