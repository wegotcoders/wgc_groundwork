

def prime?(n)
  (2..n/2).none?{ |x| n % x == 0 }
end

primes = []
for i in 2...100
  primes.push(i) if prime?(i)
end

primes.inject(:+)

