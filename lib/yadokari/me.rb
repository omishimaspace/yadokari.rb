require 'yadokari/api'

module Yadokari
  class Me
    include Yadokari::Api

    def initialize(token)
      @token = token
    end

    def run
      result = do_get("/me/#{@token}")
      puts <<-EOS
*** YOUR INFOMATION ***
check in date: #{result['reservation[check_in_on]']}
check out date: #{result['reservation[check_out_on]']}
your name: #{result['reservation[name]']}
email address: #{result['reservation[email]']}
tel: #{result['reservation[tel]']}
how many man: #{result['reservation[men_number]']}
how many women: #{result['reservation[women_number]']}
**********************
      EOS
    end
  end
end
