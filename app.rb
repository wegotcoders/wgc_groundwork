require 'sinatra'
require './lib/profile'
require '/Users/tamlyn/projects/wgc_groundwork/lib/we_got_coders/content.rb'

set :application_id, '80054c1b3206110a5743c2f41c7a035b3f882889e4ff92551a11e522565a911a'
set :secret, '0e2fd70d0af46a0755aa545a1435edc5e699df8075e089eef200c8d5bc7d2387'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

include Sinatra::OauthRoutes

get '/primes' do

 
  params[:prime_sums] ? limit = params[:prime_sums].to_i : limit = 1
  @sum = Primes.sum_to(limit)

  params[:is_prime] ? input = params[:is_prime].to_i : input = 1
  Primes.is_prime(input) ? @prime = "Prime" : @prime = "Not Prime"

  params[:count_primes] ? number = params[:count_primes].to_i : number = 1
  @count = Primes.count_to(number)

  erb :primes, :layout => :main

end


get '/' do
  if signed_in?
    @profile = trainee.get_profile
    @cont = MyContent::VAR
  end

  erb :index, :layout => :main
end



post '/update' do
  
  puts "trainee body before"
  puts trainee.get_profile
  puts "params"
  puts params

  # params = {"trainee"=>{"first_name"=>"Tamlyn"}}
  # puts "new params"
  # puts params

  response = trainee.update_profile(params)

  puts "response body after"
  puts response.body
  puts "errors"
  puts response["errors"]

  puts "check response referencing:"
  puts "response[rationale]"
  puts response["rationale"]

  if @errors = response["errors"]
    erb :error, :layout => :main
  else
    puts "response.body has no errors..!!"
    puts response.body
    redirect '/'
  end
end

include Sinatra::OauthRoutes

def trainee
  @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
end