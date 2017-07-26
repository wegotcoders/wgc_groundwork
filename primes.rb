
    # Sum of primes to 100:

    require 'prime'
    puts Prime.each(100).inject :+

    # Method below returns sum of primes up to limit:

    def prime_sum(limit)
      Prime.each(limit).inject :+
    end

    puts prime_sum(2000000)
