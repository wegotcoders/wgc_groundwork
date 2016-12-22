#My attempts at some project euler prolems

# Problem 1 - Multiples of 3 and 5

def multiples_of_3_or_5(limit)
  total = 0
  for i in 1..(limit - 1)
    if i % 3 == 0 || i % 5 == 0
      total += i
    end
  end
  return total
end

puts("Problem 1: Sum of multiples of 3 or 5 under 1000: #{multiples_of_3_or_5(1000)}")

# Problem 2 - Even Fibonacci numbers

def even_fibonacci_numbers
  sum_of_even_numbers = 2
  next_number = 0
  sequence = [1,2]

  while next_number < 4_000_000
    next_number = sequence[sequence.count - 1] + sequence[sequence.count -2]
    sequence.push(next_number)
    puts (next_number)

    if next_number % 2 == 0
      sum_of_even_numbers += next_number
    end
  end

  return sum_of_even_numbers
end

#puts("Problem 1: Sum of Fibonacci even numbers less than 4 million: #{even_fibonacci_numbers}") #very slow

# Problem 3 - Largest prime factor

def get_prime_factors(num)
  factors_found = []
  current_prime = 2

  while num > 1
    while num % current_prime == 0
      factors_found.push(current_prime)
      num /= current_prime
    end
    current_prime += 1
  end

  return factors_found
end

number = 600851475143
primes = get_prime_factors(number)
puts ("Largest prime factor of #{number} is #{primes.max}" )
