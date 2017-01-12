module WeGotCoders
  class Trainee
    include HTTParty

    attr_accessor :access_token

    def initialize(url, access_token)
      self.class.base_uri url
      self.access_token = access_token
      puts "\n initializing Trainee: {self} \n"
    end
    
    ### modified
    def get_profile
        @get_profile ||= { 
          first_name: "Bartlomiej",
          last_name: "Laskowski",
          age: 22,
          status: "Student" }
    end
    #############
    
### original get_profile method
=begin 
    def get_profile
      response = self.class.get("/trainees/profile?access_token=#{access_token}")
       puts "\n code is: #{response.code}, response is: #{response} \n"
       if response.code == 200
         @get_profile ||= JSON.parse(response.body)
       else
         raise Exception.new("Could not find profile. Is the site_url correct?")
       end
     end
=end

    def update_profile(params)
      response = self.class.put("/trainees/profile?access_token=#{access_token}", :body => params)
    end
  end
end