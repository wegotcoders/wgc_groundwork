require 'prime'
array_of_primes = []
(1..100).each do |n|
    if Prime.prime?(n)
        array_of_primes << n
    end
end

answer = array_of_primes.inject(:+)

puts "Sum of primes below #{100} is #{answer}."
