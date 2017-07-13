class Primes
  def self.sum_to(limit = 100)
    # TODO - add your prime number solution here...

num = 1 
last = 100
primes = []

while (num <= last)
  condition = true
  x = 2
  
  while (x <= num / 2)
    if (num % x == 0)
      condition = false
      break
    end 

    x = x + 1  

  end
  
  if condition && num > 1    
    
      primes << num
       
  end
   
  num = num + 1
  
end

print primes.inject(:+)
