class WebController < ApplicationController
  protect_from_forgery
  def index
    
  end

  def register
    
  end

  def create_registration
    #TODO add form validation
    #TODO add record creation
    #TODO add paypal interaction
    render json: params
  end
end
