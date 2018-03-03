require 'faraday'
require 'json'

module Yadokari
  module Api
    END_POINT = 'https://yado-kari.herokuapp.com'.freeze
    API_ENTRY_POINT = '/api/v1'.freeze

    def do_post(path, params)
      res = client.post entry_path(path), params
      JSON.parse res.body
    end

    def do_get(path)
      res = client.get entry_path(path)
      JSON.parse res.body
    end

    private

    def client
      Faraday.new(url: END_POINT)
    end

    def entry_path(path)
      "#{API_ENTRY_POINT}#{path}"
    end
  end
end
