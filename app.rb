require 'sinatra'
require './lib/profile'

set :application_id, '052846389e49b73d07f9564c19eb03d31036e72041d3fa0b213d43752d7cb746'
set :secret, 'ad34b0a5652090cf46f71bbc8bd031230d4cdcb3373fa2e88eb77627a2401d4e'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  #limit = 100

  puts 'Enter any number upto 2000000 to find the sum of prime numbers less than the number'
  limit=get.chomp.to_i

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)

  erb :primes, :layout => :main
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