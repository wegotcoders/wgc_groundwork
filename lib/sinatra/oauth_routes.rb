require 'sinatra/base'

module Sinatra
  module OauthRoutes
    def self.registered(app)

      def client
        OAuth2::Client.new(
          settings.application_id,
          settings.secret,
          :site => settings.site_url,
          :token_method => :post,
        )
      end

      def access_token
          puts "Sinatra.access_token, self: #{self}"
        OAuth2::AccessToken.new(client, session[:access_token], :refresh_token => session[:refresh_token])
      end

      def signed_in?
          puts "\n Oauth.signed_in?\n"
        !session[:access_token].nil?
      end

      app.get '/authorise' do
        puts "\n Sinatra.app.get'/authorise': redirect_uri: #{settings.redirect_uri} \n"
        redirect client.auth_code.authorize_url(:redirect_uri => settings.redirect_uri)
      end

      app.get '/callback' do
          puts "\n Sinatra.app.get'/callback' #{self}\n"
        if params["error"]
          @errors = Hash.new[params["error"]]= params["error_description"]
          erb :error, :layout => :main
        else
          new_token = client.auth_code.get_token(params[:code], :redirect_uri => settings.redirect_uri)
          session[:access_token]  = new_token.token
          session[:refresh_token] = new_token.refresh_token

          redirect '/'
        end
      end
    end
  end

  register OauthRoutes
end