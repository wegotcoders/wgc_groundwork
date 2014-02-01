module WeGotCoders
  class Trainee
    include HTTParty

    attr_accessor :access_token

    def initialize(url, access_token)
      self.class.base_uri url
      self.access_token = access_token
    end

    def get_profile
      response = self.class.get("/trainees/profile?access_token=#{access_token}")
      @get_profile ||= JSON.parse(response.body)
    end

    def update_profile(params)
      response = self.class.put("/trainees/profile?access_token=#{access_token}", :body => params)
    end
  end
end