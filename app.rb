require 'sinatra'
require './lib/profile'

set :application_id, '3f66cfdad4f14df45f90d74f7ca9d4d94a808e929136cdd0f4449c90fe4482df'
set :secret, '88035a7be7eb3972f4ce0885b22b72b831cef36f7932bd65e4093138d76ae017'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = 100

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)

  erb :primes, :layout => :main
end

get '/about' do
  erb :about, :layout => :main
end

get '/ambition' do
  erb :ambition, :layout => :main
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