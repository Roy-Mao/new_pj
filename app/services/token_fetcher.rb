class TokenFetcherService < TokenService
    include HTTParty
    base_uri BASE_URI

    def initialize(phone_number)
        @query_options = { verification: { phone_number: phone_number, country: "cn" } }
    end

    def fetch_token
      self.class.post("/sms_verifier", @query_options)
    end
end