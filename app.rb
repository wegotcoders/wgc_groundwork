require 'sinatra'
require './lib/profile'

set :application_id, 'a92d58631a944a1b13c5fe8044ed444ad71bee9f3d0f829b7d3548383e5864f0'
set :secret, '3ab9072abef68f23f44ccf51b6b78039cc86cd3e9fb736e64d29a031448d7f48'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  @limits = 100

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(@limits)

  erb :primes, :layout => :main
end

post '/primes' do
  # TODO - Can we make this dynamic?
  @limits = params["limits"].to_i


  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(@limits)

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
