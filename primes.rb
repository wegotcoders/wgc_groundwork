class Primes
  def self.sum_to(limit = 100)
    limit = limit.to_i
    total = 0
    2.upto(limit) do |num|
      total += num if prime?(num)
    end
    total
  end  

  def self.prime?(num)
    (2...num).to_a.all? { |n| num % n != 0 }
  end
end

