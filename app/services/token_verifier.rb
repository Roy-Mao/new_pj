class TokenVerifierService < TokenService
    include HTTParty
    base_uri BASE_URI

    def initialize(code)
        @query_options = { verification: { code: code } }
    end

    def verify_token
      self.class.post("/sms_verifier", @query_options)
    end
end