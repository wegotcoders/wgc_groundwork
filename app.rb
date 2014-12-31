require 'sinatra'
require './lib/profile'
require 'uri'


set :application_id, 'fc96cfedbad1b944ee5547194463c343a4fe4e5865bc3e0e13db96ca8f2d3f92'
set :secret, '7ed0039d96e468702067401b9b9ee060bca6c8eba4e04955eeccba8ccc1caa79'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

get '/primes' do
  # TODO - Can we make this dynamic?
	uri = Addressable::URI.parse("http://example.com/?var=value")
	uri.query_values # => {"var"=>"value"}
	puts uri.to_s # => "http://example.com/?two=2&one=1"
  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(1000)

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