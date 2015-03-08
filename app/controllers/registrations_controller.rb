class RegistrationsController < ApplicationController
  before_action :set_registration, only: [:show, :edit, :update, :destroy]
  protect_from_forgery except: [:hook]

  http_basic_authenticate_with name: "admin", password: "=2M52XkQ", except: [:new, :create, :hook]
  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = Registration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @errors = []
    if params[:agreed_to_terms] == false
      @errors << "You must accept the terms of agreement"
    end

    #TODO add more form validation
    if @errors.length > 0
      return render "new"
    end

    @registration = Registration.new(registration_params)

    if @registration.save
      redirect_to @registration.paypal_url(registration_path(@registration))
    else
      @errors << @registration.errors
      render "new"
    end
  end

  # PATCH/PUT /registrations/1
  # PATCH/PUT /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration.destroy
    respond_to do |format|
      format.html { redirect_to registrations_url, notice: 'Registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Paypal Callback
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.payment_confirmed = true
      @registration.save
    end
    render nothing: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = Registration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:first_name, :last_name, :date_of_birth, :email, :phone_number, :video, :first_mp3, :second_mp3, :agreed_to_terms, :payment_confirmed)
    end
end
