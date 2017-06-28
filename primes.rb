class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...

    require 'cgi'
require 'prime'
array_of_primes = []
start_time = Time.now
(1..100).each do |n|
    if Prime.prime?(n)
        array_of_primes << n
    end
end

answer = array_of_primes.inject(:+)
duration = Time.now - start_time

puts "Sum of primes below #{100} is #{answer}. Took #{duration} s to calculate using my Ruby's Prime.prime? method." 

    "I'm working on it!"
  end
end