module WeGotCoders
  class Trainee
    include HTTParty

    attr_accessor :access_token

    def initialize(url, access_token)
      self.class.base_uri url
      self.access_token = access_token
    end

    def get_profile
      response = self.class.get("/trainees/profile?access_token=#{access_token}") ## this is where they've collected the redacted information.
        
        #hidden_stuff = curl 'http://wegotcoders.com/trainees/secret?access_token=#{access_token}'
        
        puts "The access token is:   #{:access_token}"
        #puts "hidden_stuff is #{hidden_stuff}"
        
      if response.code == 200
          @get_profile ||= JSON.parse(response.body) #
      else
        raise Exception.new("Could not find profile. Is the site_url correct?")
      end
    end

    def update_profile(params)
      response = self.class.put("/trainees/profile?access_token=#{access_token}", :body => params)
    end
  end
end

       
        
