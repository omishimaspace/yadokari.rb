require 'highline'
require 'ostruct'
require 'yadokari/api'

module Yadokari
  class Reservation
    def initialize(yado_id)
      @yado_id = yado_id
    end

    def run
      cli = HighLine.new
      reserve = Reserve.new
      reserve.check_in_on = cli.ask('check in date:', Date)
      reserve.check_out_on = cli.ask('check out date:', Date)
      reserve.name = cli.ask('your name:')
      reserve.email = cli.ask('email address:')
      reserve.mens_number = cli.ask('how many man?:')
      reserve.womens_number = cli.ask('how many women?:')

      # TODO: confirmation

      reserve.post


#       puts <<-'EOS'
# check in date: 2018/07/07
# check out date: 2018/07/08
# your name: mishima
# email address: mishima@example.com
# how many people: 5
#
# *** YOUR INFOMATION ***
# 1. check in date: 2018/07/07
# 2. check out date: 2018/07/08
# 3. your name: mishima
# 4. email address: mishima@example.com
# 5. how many people: 5
# **********************
#
# confirm(Y/y) or edit(1-5): 2
# check out date: 2018/07/09
#
# *** YOUR INFOMATION ***
# 1. check in date: 2018/07/07
# 2. check out date: 2018/07/09
# 3. your name: mishima
# 4. email address: mishima@example.com
# 5. how many people: 5
# **********************
#
# confirm(y) or edit(1-5): y
# done!!
#
# *** YOUR TOKEN ***
# jfkdjakfjdkfjkdjk
# ******************
#       EOS
    end
  end
  class Reserve < OpenStruct
    include Yadokari::Api
    def post
      pp do_post('/yados/1/reservations', self.to_h)
    end
  end
end
