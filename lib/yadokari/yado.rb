require 'yadokari/api'

module Yadokari
  class Yado
    include Yadokari::Api

    def list
      do_get('/yados')
    end

    def show(yado_id)
      do_get("/yados/#{yado_id}")
    end
  end
end
