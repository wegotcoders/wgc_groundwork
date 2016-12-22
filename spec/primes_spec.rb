require 'spec_helper'

describe Primes do

  it "should caculate the sum of prime numbers to 100" do
    expect(Primes.sum_to).to eq(1060)
  end

  xit "should caculate the sum of prime numbers to 1000" do
    expect(Primes.sum_to(1_000)).to eq(76127)
  end

  xit "should caculate the sum of prime numbers to 10000" do
    expect(Primes.sum_to(10_000)).to eq(5736396)
  end
  
  it "should return Multiples of 3 and 5" do
    n = Random.rand(1000)
    i = 0
    r = 0
    while i < n do 
      i+=1
      if (i%3 == 0 or i%5 ==0)
        r+=i
      end
    end
    puts r
    expect(Primes.multiples(10)).to eq(33)
  end
  
  it "should return fibonacci numbers" do
    n = 10
    a = [0]
    #Fn = F[n-1] + F[n-2]
    n.times do |i|
      if i == 0
        a[i] = 0
      elsif i==1 
        a[i] = 1
      else
      a[i] = a[i-1] + a[i-2]
      puts "fibonacci numbers: #{a[i]} "
      end
    end
    expect(Primes.fibonacci(3)).to eq([0,1,1])
    expect(Primes.fibonacci(4)).to match_array([0,1,1,2])
  end

end