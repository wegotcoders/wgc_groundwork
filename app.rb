require 'sinatra'
require './lib/profile'

set :application_id, '279b70e2ddbdbe759a454f2cd5bf6ccf62e4db51f31450e625f0c9b7d8aae640'
set :secret, '8a98c89d14f42107de125ce4f23b9798340f927a1a89ec553074fb02322795a3'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = 100

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)

  erb :primes, :layout => :main
end

get '/edit' do
  @profile = trainee.get_profile
  erb :edit, :layout => :main
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
