class Primes
  def self.sum_to(limit = 100)
    primes = (2..100).select do |n| 
    (2..Math.sqrt(n)).none? do |i|
       (n % i).zero?
    end

  sum = primes.reduce(:+)  
  
  puts total_count

    "I'm working on it!"
  end
end