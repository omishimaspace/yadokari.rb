require 'thor'
require 'xcal'
require 'yadokari/reservation'

module Yadokari
  class CLI < Thor

    desc 'list', 'list yahos'
    def list
      puts '1. omishima-space'
    end

    desc 'show YADO', 'show yado infomation'
    def show(yado)
      yado_information = case yado
                         when 'omishima-space'
                           'https://omishima-space.com/'
                         else
                           'show nothing'
                         end
      puts yado_information
    end

    desc 'cal YADO', 'show yado calendar'
    def cal(yado)
      Xcal::Xcal.new.main([''])
    end

    desc 'reserve YADO', 'reserve yado'
    def reserve(yado)
      reservation = Yadokari::Reservation.new(yado_id(yado))
      reservation.run
    end

    desc 'me TOKEN', 'show your reservation'
    def me(token)
      puts <<-'EOS'
*** YOUR INFOMATION ***
1. check in date: 2018/07/07
2. check out date: 2018/07/09
3. your name: mishima
4. email address: mishima@example.com
5. how many people: 5
**********************
      EOS
    end

    desc 'hoge', 'hogehoge'
    def hoge
      reserve = Yadokari::Reserve.new
      reserve.check_in_on = Date.new(2018, 3, 3)
      reserve.check_out_on = Date.new(2018, 3, 4)
      reserve.name = 'sakape'
      reserve.email = 'sakape@example.com'
      reserve.mens_number = '3'
      reserve.womens_number = '2'
      pp reserve.post
    end

    private

    def yado_id(yado)
      1
    end
  end
end
