class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...
    require 'prime'

p = Prime.new
(1..100).each do |n|
  q = p.next()
  puts "#{n}: #{q}" 
end

Prime.each(100).reduce(:+)

  end
end
