require "prime"
class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    sum = 0
    i = 1
	loop do
		break if i > limit
		sum += i if Prime.prime?(i)
	end
	puts sum
	sum
  end

  puts Primes()
end