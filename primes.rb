class Primes

  #recursive prime can only cope up to a certain number
  #uh oh.. of course ruby stack levels get super deep
  #with large numbers then bails out
  def self.prime?(n, current=2, invocations=1)
    print '*'
    if n < 1
      return false
    elsif n < 4 || current >= n / (current - 1)
      return [invocations, true]
    end

    if n % current == 0
      return [invocations, false]
    else
      return prime?(n, current + 1, invocations + 1)
    end
    return [invocations, true]
  end

  #implemented using loop
  #no stack level problems here
  def self.loop_prime?(n)
    return false if n < 1

    for divider in 2..n-1
      print '*'
      if n % divider == 0
        return [divider, false]
      elsif divider >= (n / divider) #bails out asap do no loop through till n.length - 1
        return [divider, true]
      end
    end
    return [n-1, true]
  end

  #return sum of prime numbers up to n
  #add primes to array as you go and bails out asap
  #does not check the whole prime_array.length
  #could possibly improve speed by not checking
  #even numbers apart from 2
  def self.prime_sum(n)
    if n < 2
      return 0
    end

    prime_array = [2]

    for current in (prime_array.last + 1)..n
      is_prime = true

      prime_array.each do |divider|
        if current % divider == 0
          is_prime = false
          break
        elsif divider >= current / divider
          break
        end
      end
      prime_array << current if is_prime
    end

    #puts prime_array
    return prime_array.reduce(0, :+)
  end

  def self.sum_to(limit = 100)
    prime_sum(limit)
  end

end
