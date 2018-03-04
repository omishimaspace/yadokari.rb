require 'yadokari/api'

module Yadokari
  class Schedule
    include Yadokari::Api

    def initialize(yado_id)
      @yado_id = yado_id
    end

    def list
      do_get("/yados/#{@yado_id}/schedules")
    end
  end
end
