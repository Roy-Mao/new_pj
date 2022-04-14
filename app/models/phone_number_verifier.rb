class PhoneNumberVerifier

  DEFAULT_COUNTRY_CODE = "cn"

  def initialize(phone_number: phone_number_param, country_code: DEFAULT_COUNTRY_CODE)
    @phone_number = phone_number
    @country_code = country_code
  end

  def valid_number?
    params = {
      verification: { 
        phone_number: @phone_number,
        country_code: @country_code
      }
    }
    @verify_response ||= Align::ApiService.post_request("sms_verifier", params)
    @verify_response.success?
  end

  def sid
    JSON.parse(@verify_response.body)["sid"]
  end
end