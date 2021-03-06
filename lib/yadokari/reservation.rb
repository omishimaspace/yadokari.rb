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
      reserve.tel = cli.ask('tel:')
      reserve.men_number = cli.ask('how many man?:')
      reserve.women_number = cli.ask('how many women?:')
      reserve.check_in_time = cli.ask('check in time:')
      reserve.purpose_of_use = cli.ask('purpose of use:')
      reserve.payment_method = cli.ask('payment method:')
      reserve.coupon = cli.ask('coupon:')
      reserve.note = cli.ask('note:')

      # FIXME: confirmation

      result = reserve.post(@yado_id)
      puts <<-EOS
*** YOUR TOKEN ***
#{result['token']}
******************
      EOS
    end
  end
  class Reserve < OpenStruct
    include Yadokari::Api

    def post(yado_id)
      do_post("/yados/#{yado_id}/reservations", params)
    end

    private

    def params
      Hash[to_h.map { |key, value| ["reservation[#{key}]", value] }]
    end
  end
end
