require 'sinatra'
require './lib/profile'

set :application_id, '95feed7c3475bdb2687f765a01f728b7601e16575f4a715af1687188afa0de53'
set :secret, 'ecd35f71f77815c0154d338f68a6f1d0564089e42eb93e216874b0f3f2d0a59a'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  @limit = params[:limit].to_i
  @limit ||= 100
  # TODO - add your prime number solution in the primes.rb file.
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