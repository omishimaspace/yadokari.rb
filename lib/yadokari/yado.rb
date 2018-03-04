require 'yadokari/api'

module Yadokari
  class Yado
    include Yadokari::Api

    def list
      do_get('/yados')
    end
  end
end
