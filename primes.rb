class Primes
  require 'prime'
  def self.sum_to(limit = 100)
    sum = 0
    Prime.each(limit) do |prime|
      sum+=prime
    end
    return sum
  end
  
  def self.multiples(n = 10)
   i = 0
   r = 0
   while i < n do 
      i+=1
      if (i%3 == 0 or i%5 ==0)
        r+=i
      end
    end
      return r
  end
  def self.fibonacci(n)
    a = [0]
    n.times do |i|
      if (i == 0)
        a[i] = 0
      elsif (i==1) 
        a[i] = 1
      else
      a[i] = a[i-1] + a[i-2]
      end
    end
   return a
  end
end