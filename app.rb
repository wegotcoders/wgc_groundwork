require 'sinatra'
require './lib/profile'

set :application_id, '965768a2ca1bfdc1abec97f9f2b1dd15ce73cd7e4482e70b2ab6003459711ec3'
set :secret, 'a008c5ed517b7b8767afafc5824b88e46d789cd67f18557eec9144d0f48424de'
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
