=begin
  I have used Sieve of Eratosthenes - an ancient algorithm for finding
  prime numbers. Its logic is brilliant in comparision to brute force,
  double looped, one-by-one solution.

=end
class Primes
  @@sieve = Hash.new(true)
  
  def self.sum_to(limit = 100)
    sift(limit)
    
    primes = 0
    for i in 2 .. limit do
      primes += 1 if @@sieve[i]
    end
    primes
  end
  
    private
    def self.sift(n)
      for i in 2 .. Math.sqrt(n) do
        if @@sieve[i]
          j = i * i
          while j <= n do
            @@sieve[j] = false
            j += i
          end
        end
      end
    end

end

### Uncomment to check speed. It takes around 2.5 seconds on mine machine 

# start = Time.now
# puts "\n\nprimes in 2M = #{Primes.sum_to(2_000_000)}, done in #{Time.now - start} seconds\n\n\n"

###