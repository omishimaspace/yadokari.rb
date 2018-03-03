require 'thor'
require 'xcal'

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
      puts <<-'EOS'
check in date: 2018/07/07
check out date: 2018/07/08
your name: mishima
email address: mishima@example.com
how many people: 5

*** YOUR INFOMATION ***
1. check in date: 2018/07/07
2. check out date: 2018/07/08
3. your name: mishima
4. email address: mishima@example.com
5. how many people: 5
**********************

confirm(Y/y) or edit(1-5): 2
check out date: 2018/07/09

*** YOUR INFOMATION ***
1. check in date: 2018/07/07
2. check out date: 2018/07/09
3. your name: mishima
4. email address: mishima@example.com
5. how many people: 5
**********************

confirm(y) or edit(1-5): y
done!!

*** YOUR TOKEN ***
jfkdjakfjdkfjkdjk
******************
      EOS
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
  end
end
