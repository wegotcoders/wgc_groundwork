require 'sinatra'
require './lib/profile'

set :application_id, '95feed7c3475bdb2687f765a01f728b7601e16575f4a715af1687188afa0de53'
set :secret, 'ecd35f71f77815c0154d338f68a6f1d0564089e42eb93e216874b0f3f2d0a59a'
set :redirect_uri, 'http://localhost:4567/callback'
set :site_url, 'http://wegotcoders.com'
set :session_secret, 'secret'
enable :sessions

def kids_age(dob, as_of = Time.now.utc.to_date ) 
  adjuster = (as_of.month > dob.month || (as_of.month == dob.month && as_of.day >= dob.day)) ? 0 : 1
  dob_years = as_of.year - dob.year - adjuster
  days_since_bday = Date.new(1900, as_of.month, as_of.day) - Date.new(1900 - adjuster, dob.month, dob.day) 
  quarter = (days_since_bday.to_f * 4 / 365).floor # Not perfect. Will be wrong if on a quarter boundary and if this is a leap year.
  number_words = {1 => "a quarter", 2 => "a half", 3 => "three quarters"}
  "Age #{dob_years}" << (quarter>0 ? ' and ' << number_words[quarter] : "")
end

get '/primes' do
  # TODO - Can we make this dynamic?
  @limit = params[:limit].to_i

  # TODO - add your prime number solution in the primes.rb file.
  @sum = Primes.sum_to(@limit)

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