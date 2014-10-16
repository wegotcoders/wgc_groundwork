require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'
require 'sass'
require './lib/profile'


#changed the app.rb a wee bit
#now starts the server by typing rackup -p 4567
#in the terminal
class App < Sinatra::Base
  set :application_id, '5b3223c71ae774c7d2e4dfe4c34e16851e6470ef99e3e1d81fdf0976f472b2ba'
  set :secret, 'c384151e9854c0feafa6015a214d21ff69539278fa00f99e801f00d7fb5633f1'
  set :redirect_uri, 'http://localhost:4567/callback'
  set :site_url, 'http://wegotcoders.com'
  set :session_secret, 'secret'
  enable :sessions

  register Sinatra::AssetPack
  assets do

   js  :application, [
     '/js/form.js'
   ]

   css :application, [
     'stylesheets/reset.css',
     'stylesheets/main.css',
     'css/header.css',
     'css/body_content.css',
     'css/bootstrap.min.css',
     'bootflat/css/bootflat.css'
   ]
   css_compression :sass
  end

  get '/primes' do
    if signed_in?
      @profile = trainee.get_profile
    end

    limit = 100
    if params['limit']
      @sum = Primes.sum_to(params['limit'].to_i)
    else
      @sum = Primes.sum_to(limit)
    end

    if request.xhr?
      'The sum is ' + @sum.to_s + '!'
    else
      haml :primes, :layout => :main
    end
  end

  get '/' do
    if signed_in?
      @profile = trainee.get_profile
    end

    haml :index, :layout => :main
  end

  #let me see everything in text
  #in raw-ish form
  get '/raw' do
    if signed_in?
      @profile = trainee.get_profile
    end
    haml :raw, :layout => :main
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
  register Sinatra::OauthRoutes

  def trainee
    @trainee ||= WeGotCoders::Trainee.new(settings.site_url, session[:access_token])
  end
end

