class PatientsController < ApplicationController
  #authenticate that the user is a patient in order to allow access to CRUD actions and their specific dishes, all patients can view each other's patients
  #customer should only have show access
  before_action :authenticate_user!
  before_action :set_patient, only: [:edit, :update, :destroy]
  before_action :check_permission, only: [:edit, :update, :destroy]
  # GET /patients/1
  # GET /patients/1.json
  def index
    @patients = Patient.all
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    @patient.specialty_ids = params[:patient][:specialty_ids]
    saved = @patient.save
    respond_to do |format|
      if saved
        format.html { redirect_to root_path, notice: "Patient was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    @patient.specialty_ids = params[:patient][:specialty_ids]
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to root_path, notice: "Patient was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def dashboard
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # redirect if someone manualy tries to change route
  def check_permission
    unless @patient.user_id == current_user.id
      redirect_back(fallback_location: root_path,
        alert: "Error: Permission denied - Invalid User")
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def patient_params
    params.require(:patient).permit(:user_id, :first_name, :last_name, :dob, :gender, :ndis_status, :ndis_number, :postcode, :specialty_ids)
  end
end
