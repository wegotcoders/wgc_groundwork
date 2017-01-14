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
          name: "Bartlomiej Laskowski",
          age: 22,
          webpage: "<a href='https://frameture.github.io'>frameture.github.io</a>",
          email: "frameture@gmail.com",
          phone: "0048 794 668 294",
          status: "Student" ,
          about: 
              "Despite the fact that I am 22, I have begun my studies last year (quite late). I study 
              computing at Arden University (distance learning). After I have finished 
              my high school, I was looking for the best path for myself, so I have 
              travelled and worked.  I have spent whole 2015 in Copenhagen working 
              in different places, mostly in hospitality industry. In the late 2015 I have 
              started my journey with programming and got in love with it. I have spent 
              almost all 2016 on learning programming. In 2016 I have also worked as 
              an assistant to the local agriculture import-export company. My main 
              responsibility was to translate during dialogs and negotiations with 
              overseas business partners. The job also included number of abroad 
              business trips.",
          
          programming_project: 
            "I have not taken part in any collaborative project as I was learning 
            everything myself. But I have developed one, my personal webpage 
            hosted on GitHub: <a href='https://frameture.github.io' target='_blank'>frameture.github.io</a> 
            I have developed it with using HTML, CSS and JavaScript with jQuery. It 
            was not difficult as it only contains few features, which rely mostly on 
            user-events. I tried to use all best-practices and conventions I know, 
            but I have begun web development not long ago and do not have yet
            much knowledge in this field. One of the more demanding things in 
            this project was to dynamically insert SVG for drawing ‘programming-log' 
            feature as it was first time I have used it.",
          
          why: 
            "I am seeking a career in web development and decided that I will take 
            part in a coding bootcamp. I know fundamentals of programming and 
            already know Java quite well so, I know that I will take a lot of knowledge 
            from such camp. After research I have decided that ‘We Got Coders' is 
            the best fit as you teach Ruby with Rails, which I would like to learn, 
            and also offer real experience with working on client-based projects.",
          
          one_year_time: 
            "In 1 year's time, I see myself working as a full-stack developer and 
            getting skills, experience and knowledge to be promoted a senior position.",
            
          learning_experience: 
            "I have been learning programming for a year and I value best resources 
            and practicing most. But I have missed good advices from experienced
            programmers, which would help greatly. I would also say that working
            in collaboration with others would make my learning experience better.
            For a commercial training it also fits great to offer work placements as 
            you do, and I think that would be the best part of it." 
        }
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