class TestRegistrationsController < ApplicationController
  before_action :set_test_registration, only: [:show, :edit, :update, :destroy]

  # GET /test_registrations
  # GET /test_registrations.json
  def index
    @test_registrations = TestRegistration.all
  end

  # GET /test_registrations/1
  # GET /test_registrations/1.json
  def show
  end

  # GET /test_registrations/new
  def new
    @test_registration = TestRegistration.new
  end

  # GET /test_registrations/1/edit
  def edit
  end

  # POST /test_registrations
  # POST /test_registrations.json
  def create
    @test_registration = TestRegistration.new(test_registration_params)
      if @test_registration.save
        redirect_to @test_registration.paypal_url(test_registration_path(@test_registration))
      else
        format.html { render :new }
        format.json { render json: @test_registration.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /test_registrations/1
  # PATCH/PUT /test_registrations/1.json
  def update
    respond_to do |format|
      if @test_registration.update(test_registration_params)
        format.html { redirect_to @test_registration, notice: 'Test registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_registration }
      else
        format.html { render :edit }
        format.json { render json: @test_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_registrations/1
  # DELETE /test_registrations/1.json
  def destroy
    @test_registration.destroy
    respond_to do |format|
      format.html { redirect_to test_registrations_url, notice: 'Test registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # Paypal Callback
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @test_registration = TestRegistration.find params[:invoice]
      @test_registration.update_attribute confirmed: true
    end
    render nothing: true
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_registration
      @test_registration = TestRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_registration_params
      params.require(:test_registration).permit(:confirmed, :confirmation_status, :name)
    end
end
