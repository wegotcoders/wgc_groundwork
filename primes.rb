class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    prime_num = Array.new
    "I'm working on it!"
  
    for i in (2..limit) do
      for j in (2..i) do
        break if i%j == 0
      end

    # p "#{i} is a prime number." if i == j
    prime_num[i] = i if i == j;

    end
    return prime_num
  end
end
