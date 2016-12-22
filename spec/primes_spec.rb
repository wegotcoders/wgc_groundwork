require 'spec_helper'

describe Primes do

  it "should caculate the sum of prime numbers to 100" do
    expect(Primes.sum_to).to eq(1060)
  end

  it "should caculate the sum of prime numbers to 1000" do
    expect(Primes.sum_to(1_000)).to eq(76127)
  end

  it "should caculate the sum of prime numbers to 10000" do
    expect(Primes.sum_to(10_000)).to eq(5736396)
  end

  it "should caculate the sum of prime numbers to 2000000" do
    expect(Primes.sum_to(2_000_000)).to eq(142913828922)
  end

end
