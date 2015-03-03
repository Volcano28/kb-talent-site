class WebController < ApplicationController
  protect_from_forgery
  def index
    
  end

  def register
    
  end

  def create_registration
    @errors = []
    #TODO add form validation
    if params[:email] != params[:confirm_email]
      @errors << "Emails do no match"
    end
    if !params[:agree_to_terms]
      @errors << "You must accept the terms of agreement"
    end

    #TODO add record creation
    #
    #TODO add paypal interaction

    #TODO render success or form with @errors
    if @errors.length
      return render "register"
    end
    render json: @errors.length > 0 ? @errors : params
  end
end
