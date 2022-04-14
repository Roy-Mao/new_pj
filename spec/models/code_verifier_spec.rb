require "rails_helper"

RSpec.describe CodeVerifier, :type => :model do
  subject { described_class.new( sid: sid_param, code: code_param) }
  
  describe "#valid_code?" do
    context "when valid" do
      let(:sid_param) { "SMb39c336f69e343c9b0474ab644a38a94" }
      let(:code_param) { "3435" }

      it "return true" do
        VCR.use_cassette("align_api_code_success_200") do
          expect(subject.valid_code?).to be true
        end
      end
    end

    context "when invalid" do
      context "sid_param not given" do
        let(:sid_param) { "" }
        let(:code_param) { "3435" }

        it "return false with 404" do
          VCR.use_cassette("align_api_code_error_404") do
            expect(subject.valid_code?).to be false
          end
        end
      end

      context "code_param not given" do
        let(:sid_param) { "SMb39c336f69e343c9b0474ab644a38a94" }
        let(:code_param) { "" }

        it "return false with 400" do
          VCR.use_cassette("align_api_code_error_400") do
            expect(subject.valid_code?).to be false
          end
        end
      end
    end
  end
end