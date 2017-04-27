require 'sinatra'
require './lib/profile'

set :application_id, '22604679c625c388f68afe3044c21a7d85303998a740d61ab4eb3d1981ca6884'
set :secret, '78ddb0e3d056d58ce7399b9577e5e99f26006639f87dea562e5a2d472920da8b'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  #limit = 100
  limit = params[:limit].to_i
  @number = limit

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
