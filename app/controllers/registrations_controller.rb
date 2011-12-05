class RegistrationsController < ApplicationController
  def create
    
    Registration.create! name: params[:name]
    
    render nothing: true
    
  end

end
