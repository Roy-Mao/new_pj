require "rails_helper"

RSpec.describe PhoneNumberVerifier, :type => :model do
  subject { described_class.new( phone_number: number_param) }
  
  describe "#valid_number?" do
    context "when giving valid number" do
      let(:number_param) { "13900888888" }

      it "return true" do
        VCR.use_cassette("align_api_number_success_200") do
          expect(subject.valid_number?).to be true
          expect(subject.sid).to be_kind_of(String)
        end
      end
    end

    context "when giving wrong number" do
      let(:number_param) { "1ab" }

      it "return false with 500 error" do
        VCR.use_cassette("align_api_number_error_500") do
          expect(subject.valid_number?).to be false
        end
      end
    end
  end
end