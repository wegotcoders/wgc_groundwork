class Primes
  def self.sum_to(limit=100)
    # TODO - add your prime number solution here...
    
    require 'prime'
    primes_array = []
    (0..limit).each do |n|
        if Prime.prime?(n)
            primes_array << n
        end
    end

    prime_sum = primes_array.inject(:+)


  end
end

puts "#{Primes.sum_to()}"
puts "#{Primes.sum_to(limit=1000)}"
puts "#{Primes.sum_to(limit=10000)}"
