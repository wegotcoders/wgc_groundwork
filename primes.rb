#get '/primes' do
#    limit = params['prime_limit']
#    puts params['prime_limit']    
#end

class Primes
  def self.sum_to(limit)
    # TODO - add your prime number solution here...
      require 'prime'
      Prime.each(limit).inject(:+)
  end
end