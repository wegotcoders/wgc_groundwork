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

puts(multiples_of_3_or_5(1000))

# Problem 2 - Even Fibonacci numbers

# Problem 3 - Largest prime factor

# Problem 4 - Largest palindrome product

# Problem 5 - Smallest multiple
