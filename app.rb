require 'sinatra'
require './lib/profile'

set :application_id, 'e059a800bcd15b8f0680667b07254f7386a49714be4d6b901a966e8aae4430aa'
set :secret, '8d2cdc639996915ae26c90cb72febef5a87e3026121cc0ece35d58a196e21c25'
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

get '/edit' do
  if signed_in?
    @profile = trainee.get_profile
  end
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