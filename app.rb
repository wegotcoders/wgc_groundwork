require 'sinatra'
require './lib/profile'

set :application_id, '698e07dac0ffc330811529fe071e43a10f135e1ae77fd183643e9f76f47af1fc'
set :secret, '7a3925cd61439ad5938b6b0a7bf53e5874366933e1b94b39161b401f016efaa9'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  limit = gets.chomp
  @sum = Primes.sum_to(limit.to_i)

  erb :primes, :layout => :main
end

get '/pictures' do
  erb :pictures, :layout => :main
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