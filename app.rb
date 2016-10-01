require 'sinatra'
require './lib/profile'

set :application_id, '2a763742ef3199e389ac692aa16d84bb480d36a686c04325a6de76b93926cfe5'
set :secret, '11f30e45418d19b8679bac24c7faa3c572fbdfac4f95d3ec1457bc835d566a6a'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = 100
  

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit) 
  
  # working on it
  # userNumber = params[:userNum].to_i  
  # @sum = Primes.sum_to(userNumber)

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
