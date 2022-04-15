class PersonForm < ApplicationForm
  attr_accessor :person_attributes

  def initialize(attributes)
    super(attributes)
    @models = [person]
  end

  def person
    @person ||= Person.new(person_attributes)
  end

  def save
    number_verifier = PhoneNumberVerifier.new(
      phone_number: person_attributes[:phone_number]
    )

    if number_verifier.valid_number?
      @person = Person.new(
        name: person_attributes[:name],
        phone_number: person_attributes[:phone_number]
      )

      Person.transaction do
        @person.save!

        OneTimeToken.create(
          person_id: @person.id,
          token: person_attributes[:sid],
          status: false
        )
      end
    end
  end
end