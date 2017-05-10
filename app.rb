require 'sinatra'
require './lib/profile'

set :application_id, '65cf9edd83bbe8d8002baf3c3e35a30f9cf540b467819bc35e5ce4ff25ccead3'
set :secret, '35bd7d9910e6032bcda27d833ce798fd4fa8d390107c06419ab2dc5d81b2b486'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  @limit = params[:limit].to_i
  @sum = Primes.sum_to(@limit)

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
