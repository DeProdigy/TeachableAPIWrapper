require 'net/http'
require 'json'

require 'pry'

module TeachableAPIWrapper
  module Fetcher
    DOMAIN = 'https://fast-bayou-75985.herokuapp.com'

    def self.post(path, data)
      uri = URI(DOMAIN + path)
      Net::HTTP.post(uri, data.to_json, {'Content-Type' => 'application/json'})
    end

    def self.get(path, auth_data)
      uri = URI(DOMAIN + path)
      uri.query = URI.encode_www_form(auth_data)
      Net::HTTP.get_response(uri)
    end

    def self.delete(path, auth_data)
      http = Net::HTTP.new("fast-bayou-75985.herokuapp.com")
      request = Net::HTTP::Delete.new(path + "?#{URI.encode_www_form(auth_data)}")
      response = http.request(request)
    end
  end
end
