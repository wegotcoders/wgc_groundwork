require 'sinatra'
require './lib/profile'

set :application_id, '6229e7b2ccb3a5cb488c3958dca626e92e050d8799c9958952b7ce9001c3dc40'
set :secret, '31b3cad4d446300cf3372feca9c6e41846c80740a8924d1aaf9d8358f10ceadf'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  limit = 2000000
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
