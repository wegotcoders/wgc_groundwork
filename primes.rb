class Primes
  def self.sum_to(limit)
    sum = 0
    n = 1
    while n < limit
        n += 1
        is_prime = true
        if n == 1
            is_prime = false
        end

        for i in 2..n-1
            if n % i == 0
                is_prime = false
            end
        end

        if is_prime == true
            sum += n
        end
    end

    return sum
  end
end
