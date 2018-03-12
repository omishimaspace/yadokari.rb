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
check in date: #{result['check_in_on']}
check out date: #{result['check_out_on']}
your name: #{result['name']}
email address: #{result['email']}
tel: #{result['tel']}
how many man: #{result['men_number']}
how many women: #{result['women_number']}
check in time: #{result['check_in_time']}
purpose of use: #{result['purpose_of_use']}
payment method: #{result['payment_method']}
note: #{result['note']}
**********************
      EOS
    end
  end
end
