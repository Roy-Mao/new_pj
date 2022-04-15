require "rails_helper"

RSpec.describe PeopleController do
  describe "POST create" do
    before do
      allow_any_instance_of(PhoneNumberVerifier).to receive(:valid_number?).and_return(true)
    end

    it "redirect_to person#new page with http_status 302" do
      post :create, :params => { :person => { :name => "Any Name", :phone_number => "1234567890" } }
      expect(response).to have_http_status(302)
    end
  end
end