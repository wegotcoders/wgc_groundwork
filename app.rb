require 'sinatra'
require './lib/profile'

set :application_id, 'ed03fcd0da1a8b0279ca2ececfdc3b8d86b910bba99604d671041ebd26f2e917'
set :secret, '7be310043bb45121a7e36e5625560c27834d719b7c051be77a3fca2b79676bd6'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  @limit = params[:limit].to_i

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(@limit)

  erb :primes, :layout => :main
end

get '/palindrome' do

  @largest_palindrome = Palindrome.calculate

  erb :palindrome, :layout => :main
end

get '/pandigital' do

  @pandigital_sum = Pandigital.calculate

  erb :pandigital, :layout => :main
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
