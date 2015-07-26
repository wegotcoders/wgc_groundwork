require 'sinatra'
require './lib/profile'


set :application_id, '689b5053c5c6a05d1bd9485aceff4f8707bce13b38e8849669047d4a499e6b72'
set :secret, 'a54a53bb4b3fafbbda0a27c603a953d4da36f638cb211013889968043074fa49'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/prime/input' do

  erb :prime_input, :layout => :main
end

get '/primes/:limit' do |limit|
  
  @sum = Primes.sum_to(limit.to_i)

  erb :primes, :layout => :main
end

get '/' do
  if signed_in?
    @profile = trainee.get_profile
  end

  erb :index, :layout => :main
end

get '/edit' do
  if signed_in?
    @profile = trainee.get_profile
    
    @codeacademyAccount = 'skibinska'
    @primeNumberSumForTwoMilionLimit = Primes.sum_to(1000);
    
  end

  erb :edit, :layout => :main
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