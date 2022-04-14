class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    number_verifier = PhoneNumberVerifier.new(
      phone_number: params[:person][:phone_number]
    )

    if number_verifier.valid_number?
      @person = Person.new(
        name: params[:person][:name],
        phone_number: params[:person][:phone_number],
        sid: number_verifier.sid
      ).save!
  
      redirect_to people_path(@person), notice: "one time password sent successfully."
    else
      flash[:alert] = "the phone number is not valid"
      redirect_back fallback_location: { action: "new" }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
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
