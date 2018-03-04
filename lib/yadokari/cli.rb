require 'thor'
require 'xcal'
require 'yadokari/reservation'
require 'yadokari/me'
require 'yadokari/yado'
require 'yadokari/schedule'

module Yadokari
  class CLI < Thor

    desc 'list', 'list yados'
    def list
      yado = Yadokari::Yado.new
      yado.list.each do |yado|
        puts "#{yado['id']}. #{yado['name']}"
      end
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
      schedules = Yadokari::Schedule.new(yado_id(yado)).list
      schedules.each do |schedule|
        puts "#{schedule['started_on']} ~ #{schedule['finished_on']} #{schedule['schedule']}"
      end
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
