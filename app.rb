require 'sinatra'
require './lib/profile'

set :application_id, '8731ecc1361a3943a11689dbb3f1800ea50467f42e64e8ffe08b2249176754ff'
set :secret, 'a8ccb0b0bb61a5afa94fe6288458322d0c3ab1c39b04ae7a1361103153509170'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do 
  @limit = params["limit"].to_i
  if (@limit >=100000) then
    @sum = "Try a value < 100000"
  else
    @sum = "The sum of primes below " + @limit.to_s + " is " +Primes.sum_to(@limit).to_s
  end
  erb :primes 
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
