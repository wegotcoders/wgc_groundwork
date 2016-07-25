require 'sinatra'
require './lib/profile'

set :application_id, 'e4af0fd01826797ceb44903c46dd21fda63b3e2c4a288e6b9a7f115daaec7e11'
set :secret, 'a0c90aa4f8c539db9833ea9a1fb3e429556b05389ec2ab6f6e8b165b7f94f3bd'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  #N: Code works, but takes forever to load the primes page and for now input only in terminal 
  def limit
      puts "Choose a limit: "
      limit = gets.to_i
      return limit
  end
  
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
  #puts trainee
  #puts params

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
