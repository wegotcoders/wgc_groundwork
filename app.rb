require 'sinatra'
require './lib/profile'

set :application_id, '40f008bcda6b02555b9cdfe386160e63ad68a6d638b8edeeab98a51ed24f913f'
set :secret, '2427f7f10009795678635be7a3e640c88317093483433ebe948c714ec57f2624'
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
