class CodeVerifier

  def initialize(sid: nil, code: nil)
    @sid = sid
    @code = code
  end

  def valid_code?
    params = { code: @code }
    Align::ApiService.put_request(code_verify_endpoint, params).success?
  end

  private

  def code_verify_endpoint
    "sms_verifier/#{@sid}"
  end
end