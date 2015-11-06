######CANT LAUNCH SERVER WITHOUT THIS CODE###########
class Primes
  def self.sum_to(number)

    start = 2
    primes = (start..number).to_a
    (start..number).each do |no|
      (start..no).each do |num|
        if ( no % num  == 0) && num != no
          primes.delete(no)
          break
        end
      end
    end
    primes.inject(:+)
  end


end
