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

  describe "PUT update/:id" do
    before do
      allow_any_instance_of(CodeVerifier).to receive(:valid_code?).and_return(true)
    end

    context "with valid parameters" do
      let(:person_attributes) { { name: "fake_name", phone_number: "1234567890" } }
      it "hoge hoge" do
        person = Person.create(person_attributes)
        binding.pry
        put person_path(person)
        expect(response).to have_http_status(200)
        # params: { verification_code: "1234", email: "fake_name@yahoo.com", available_on: Date.today, user_type: 1 }
      end
    end
  end
end