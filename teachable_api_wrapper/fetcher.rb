require 'net/http'
require 'json'

module TeachableAPIWrapper
  module Fetcher
    DOMAIN = 'https://fast-bayou-75985.herokuapp.com'

    def self.post(path, data)
      uri = URI(DOMAIN + path)
      Net::HTTP.post(uri, data.to_json, {'Content-Type' => 'application/json'})
    end

    def self.get(path, data)
      uri = URI(DOMAIN + path)
      uri.query = URI.encode_www_form(data)
      Net::HTTP.get_response(uri)
    end
  end
end
