class TherapistsController < ApplicationController
  #authenticate that the user is a therapist in order to allow access to CRUD actions and their specific dishes, all therapists can view each other's therapists
  #customer should only have show access
  before_action :authenticate_user!
  before_action :set_therapist, only: [:edit, :update, :destroy]
  # GET /therapists/1
  # GET /therapists/1.json
  def index
    @therapists = Therapist.all
  end

  # GET /therapists/new
  def new
    @therapist = Therapist.new
  end

  # GET /therapists/1/edit
  def edit
  end

  def show
    @therapist = Therapist.find(params[:id])
  end

  # POST /therapists
  # POST /therapists.json
  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user_id = current_user.id
    saved = @therapist.save
    specialties = params[:therapist][:specialties].delete_if {|v| v==""}
    specialties.each do |x|
      therapist_specialties = TherapistSpecialty.new
      therapist_specialties.therapist_id = @therapist.id
      therapist_specialties.specialty_id = x
      therapist_specialties.save
    end

    respond_to do |format|
      if saved
        format.html { redirect_to root_path, notice: "therapist was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /therapists/1
  # PATCH/PUT /therapists/1.json
  def update
    respond_to do |format|
      if @therapist.update(therapist_params)
        format.html { redirect_to patients_path, notice: "therapist was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # redirect if someone manualy tries to change route

  # Use callbacks to share common setup or constraints between actions.
  def set_therapist
    @therapist = Therapist.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def therapist_params
    params.require(:therapist).permit(:about_me, :hourly_rate, :profile_image, :user_id, :specialties)
  end
end
