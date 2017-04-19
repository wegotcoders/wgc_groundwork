require 'sinatra'
require './lib/profile'

set :application_id, '827aa179b014d552c93ca1c7daa59293d36fc5de0d0dc4c0d572022ccf1c85b7'
set :secret, 'd46e0713d246eb310db23546219e441fa998a5bcf2aa41792d03542c78297df9'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = params[:limit].to_i
  @amount = limit
  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(limit)
  @mult = MultiplesSum.multi(limit)
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
