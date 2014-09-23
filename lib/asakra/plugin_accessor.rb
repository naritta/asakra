require 'net/http'
require 'uri'
require 'json'

module Asakra
  class PluginAccessor

    def getHash(hostname)
      hash = {"pluginId"=>"plugin01",
              "retryCount"=>rand(15)}

      return hash
    end

    def getHash_test(hostname, limit = 10)
      raise ArgumentError, 'too many HTTP redirects' if limit == 0
      #confirm uri
      location = "http://"+hostname+":24220/api/json"
      uri = URI.parse(location)
      begin
        response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
          http.open_timeout = 5
          http.read_timeout = 10
          http.get(uri.request_uri)
        end
        case response
          when Net::HTTPSuccess
            json = response.body
            JSON.parse(json)
          when Net::HTTPRedirection
            location = response['location']
            warn "redirected to #{location}"
            get_json(location, limit - 1)
          else
            puts [uri.to_s, response.value].join(" : ")
          # handle error
        end
      rescue => e
        puts [uri.to_s, e.class, e].join(" : ")
        # handle error
      end
    end
  end
end