require 'sinatra'
require './lib/profile'

set :application_id, 'b84270234c5524e99426f67fbae214062468ffc62aa107d70b41edc503cdac24'
set :secret, '29db5e8c06ccf46fb5a77e7a59d6ca5674bf4a8c489b21954bfd6c752a32156c'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  n = 100

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(n)

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