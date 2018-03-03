require 'faraday'
require 'json'

module Yadokari
  module Api
    END_POINT = 'https://a9d7220f-bbb9-4e10-a580-b88bce7a87d5.mock.pstmn.io'.freeze
    # END_POINT = 'https://yado-kari.herokuapp.com'.freeze
    API_ENTRY_POINT = '/api/v1'.freeze

    def do_post(path, params)
      client = Faraday.new(url: END_POINT)
      res = client.post "#{API_ENTRY_POINT}#{path}", params
      JSON.parse res.body
    end
  end
end
