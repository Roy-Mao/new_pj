require "rails_helper"

RSpec.describe Person, :type => :model do
  subject {
    described_class.new(
      name: "fake_name",
      phone_number: "111111111111",
      email: "fake_email@yahoo.com",
      available_on: Date.today + 1.day,
      user_type: 1
    )
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  context "test for phone_number field" do
    it "is not valid without a phone_number" do
        subject.phone_number = nil
        expect(subject).to_not be_valid
    end
  end
end
  