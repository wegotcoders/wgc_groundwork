=begin
class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    "I'm working on it!"
  end
end
=end

primes_to_hundred = Prime.take_while {|p| p < 100}

total = 0

primes_to_hundred.each { |x| total +=x }
puts total