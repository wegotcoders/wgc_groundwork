  def self.sum_to(limit)
    # TODO - add your prime number solution here...    
    i = 2
    sum = 0
    until i > 100 do 
      j = prime(i)
      sum += j
      i += 1
    end
    return sum
  end

  def prime(num)
    i = 2
    until i > (num/2)
      if num % i == 0
        return 0
      end
      i+=1
    end
    return num
  end

puts sum_to(100)