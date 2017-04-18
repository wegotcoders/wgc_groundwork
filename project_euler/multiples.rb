#Multiples of 3 and 5, problem taken from projecteuler.net

#Finds the sum of all the multiples of 3 or 5 below 1000.

multiplesSum = 0

(1...1000).each do |i|
  if (i % 3 == 0) || (i % 5 == 0)
    multiplesSum += i
  end
end
puts multiplesSum
