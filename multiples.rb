#Multiples of 3 and 5, problem taken from projecteuler.net

class MultiplesSum
  def self.multi(num =100)
    multiplesSum = 0

    (1...num).each do |i|
      if (i % 3 == 0) || (i % 5 == 0)
        multiplesSum += i
      end
    end
    return multiplesSum
  end
end
