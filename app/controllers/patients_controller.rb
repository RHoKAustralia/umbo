class PatientsController < ApplicationController
  before_action :authenticate_user!

  def show
    @patient = Patient.find(params[:id])
  end

  def dashboard
  end
  
end