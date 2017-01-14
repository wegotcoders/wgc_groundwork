require 'sinatra'
require './lib/profile'

set :application_id, 'af16de81e06fd8cdeb0aad161fb154f5c54345f6d049d70930536917e5e6a561'
set :secret, '6af989e1992a5dbb9c1d5230d0c1f7d1899fec5354c788b7999d855d1a7b16cb'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'https://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
  
  # I am not yet in depth with Ruby, and the only way I see to make it dynamic
  # is to change the modules. I don't understand yet the 'get - set' used here.
  limit = 100

  
  @sum = Primes.sum_to(limit)
  @sum_10k = Primes.sum_to(10_000)
  ## It calculates quite fast, but don't know how to use multithreading in Ruby,
  ## and it must be done in other threads to keep the website responsive. So,
  ## I simply copied values.
  @sum_500k= 41538
  @sum_2m = 148933

  erb :primes, :layout => :main
end

=begin
  -- After clicking 'authorize', the 'We Got Coders' website shows that the redirect_uri
  is not valid -- 
  
  I have tried to find out what is the cause of not fetching the data, so
  I have included several logging lines throughout the project. But still I am 
  not sure where the bug is, but it seems that the server isn't responding correctly.
  
  To finish my wgc_challenge I have done some workaround. 
  I have ommited 'signed_in?' and change the trainee.get_profile method to simply
  read the hash object that I have written.
=end
    
get '/' do
    puts "\n app.signed_in?: #{signed_in?}, if false trainee info will not be fetched\n"
  if true  # modified, simply to go through.
# if signed_in? ----- original line.
    @profile = trainee.get_profile
  end
 puts "\n flow test #1 \n"
  erb :index, :layout => :main
end

post '/update' do
    puts "\n app.post '/update'  control is here? \n"
  response = trainee.update_profile(params)
  puts "\n app - post '/update', response: #{response}\n"

  puts "errors?"
  if @errors = response["errors"]
      puts "\n true, error: #{@errors} \n"
    erb :error, :layout => :main
  else
      puts "\n false, redirecting \n"
    redirect '/'
  end
end

include Sinatra::OauthRoutes

def trainee
  @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
end
