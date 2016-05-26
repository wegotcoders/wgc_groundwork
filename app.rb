require 'sinatra'
require './lib/profile'

set :application_id, 'b5f294c431d513071d67200d65a4136602e7161d5b6688fbb88a2923a2bf5850'
set :secret, '7f8d1053a50ab54dde9134ae5427aca0bdcd115e7c4d5c45fbec5b073f2963e7'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, '7f8d1053a50ab54dde9134ae5427aca0bdcd115e7c4d5c45fbec5b073f2963e7'
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