require 'sinatra'
require './lib/profile'
require 'prime'

set :application_id, 'ddbc023751d9ca28f1969dac5eae920df67a2eb4bc644e08a6f826850907eaf9'
set :secret, 'c696ed2de1518175c706af1b2765cbc010813c9faee2e37629bc5f593313ff1e'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
def limit
	puts "Please enter any number up to 2000000 to be able to find the sum of all prime numbers less than the number:"
	limit = gets.chomp.to_i
end


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
