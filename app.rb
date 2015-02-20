#3cee27b5a0e6d08b867411b47e0e230f0b513f0618477ffedd74cad65e753089
#71e17fe2143cd92da84107f528b72dd6f3c7d38c676436f9af4ae3d9e0f82830

require 'sinatra'
require './lib/profile'

set :application_id, '3cee27b5a0e6d08b867411b47e0e230f0b513f0618477ffedd74cad65e753089'
set :secret, '71e17fe2143cd92da84107f528b72dd6f3c7d38c676436f9af4ae3d9e0f82830'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  limit = 10
0
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
