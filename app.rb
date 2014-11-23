require 'sinatra'
require './lib/profile'

set :application_id, '44c1e4c753a91ce66fb5dc11248be1cba19a1f08eb96b9330da2c6563974665c'
set :secret, '298db34efc31b79ac29f4a1cd52161eb046bbc87c13b42d33a632a847d551d00'
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

get '/' do
  if signed_in?
    @profile = trainee.get_profile
  end

  erb :index, :layout => :main
end


get '/edit' do
  if signed_in?
    @profile = trainee.get_profile
  end
  erb :edit, :layout => :main
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