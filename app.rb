require 'sinatra'
require './lib/profile'

set :application_id, '36337108d63bb81c5f6595a505d3e8e4df44daa765bac25daaad51220892b8a4'
set :secret, 'efcd3c84411ba2a1771221f3035f4f6cb517f36b4ab11847ca1b89478e4b8187'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

def time_format(date)
    require 'date'
    new_date = Date.parse(date).strftime('%d/%m/%Y')
    return new_date
end

get '/primes' do    
  @sum = Primes.sum_to(params[:prime_limit].to_i)

  erb :primes, :layout => :main
end

get '/multiples' do
    @sumMultiples = Multiples.multiples(params[:multiples_limit].to_i)

    erb :multiples, :layout => :main
end

get '/fibonacci' do
    @sumFibonacci = Fibonacci.fibonacci(params[:fibonacci_limit].to_i)

    erb :fibonacci, :layout => :main
end

get '/' do
  if signed_in?
    @profile = trainee.get_profile
  end

  erb :index, :layout => :main
end

post '/update' do
  response = trainee.update_profile(params)

  if @errors = response["errors"]
    erb :error, :layout => :main
  else
    redirect '/'
  end
end

include Sinatra::OauthRoutes

def trainee
  @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
end


