class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.search(params[:search])
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # POST /people or /people.json
  def create

    person_form = PersonForm.new(person_attributes: person_params)

    if person_form.save
      redirect_to person_form.person, notice: "one time password sent successfully."
    else
      flash[:alert] = "the phone number is not valid"
      redirect_back fallback_location: { action: "new" }, status: :unprocessable_entity
    end
  end

    # PATCH/PUT /posts/1 or /posts/1.json
    def update
      code_verifier = CodeVerifier.new(
        sid: @person.sid,
        code: params[:person][:verification_code]
      )
      if code_verifier.valid_code?
        @person.update!(
          email:params[:person][:email],
          available_on:params[:person][:available_on],
          user_type: params[:person][:user_type].to_i,
          verified: true
        )
      end
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(
        :name,
        :phone_number,
        :available_on,
        :email,
        :user_types,
        :verification_code,
        :search
      )
    end
end
