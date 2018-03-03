require 'thor'

module Yadokari
  class CLI < Thor
    desc "list", "list yahos"
    def list
      puts 'yado1'
      puts 'yado2'
    end
  end
end
