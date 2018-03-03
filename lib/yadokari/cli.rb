require 'thor'
require 'xcal'
require 'yadokari/reservation'
require 'yadokari/me'

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
      me = Yadokari::Me.new(token)
      me.run
    end

    private

    def yado_id(yado)
      1
    end
  end
end
