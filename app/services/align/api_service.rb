module Align
  class ApiService
    BASE_URI = "https://apac-consumer-web-prod-eu.herokuapp.com/"

    class << self

      def post_request(endpoint, params)
        conn.post do |req|
          req.url(BASE_URI + endpoint)
          req.body = params.to_json
          req.headers['Content-Type'] = 'application/json'
        end
      end

      def put_request(endpoint,params)
        conn.put do |req|
          req.url(BASE_URI + endpoint)
          req.body = params.to_json
          req.headers['Content-Type'] = 'application/json'
        end
      end

      private

      def conn
        Faraday.new(url: BASE_URI)
      end
    end
  end
end
