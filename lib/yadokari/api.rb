require 'faraday'
require 'json'

module Yadokari
  module Api
    END_POINT = 'https://yado-kari.herokuapp.com'.freeze
    API_ENTRY_POINT = '/api/v1'.freeze

    def do_post(path, params)
      client = Faraday.new(url: END_POINT)
      res = client.post "#{API_ENTRY_POINT}#{path}", params
      JSON.parse res.body
    end
  end
end
