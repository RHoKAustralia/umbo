class TherapistsController < ApplicationController
  #authenticate that the user is a therapist in order to allow access to CRUD actions and their specific dishes, all therapists can view each other's therapists
  #customer should only have show access
  before_action :authenticate_user!
  before_action :set_therapist, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, only: [:edit, :update, :destroy]
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
  end

  # POST /therapists
  # POST /therapists.json
  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user_id = current_user.id
    @therapist.specialty_ids = params[:therapist][:specialty_ids]

    respond_to do |format|
      if @therapist.save
        format.html { redirect_to root_path, notice: "Therapist was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /therapists/1
  # PATCH/PUT /therapists/1.json
  def update
    @therapist.specialty_ids = params[:therapist][:specialty_ids]
    respond_to do |format|
      if @therapist.update(therapist_params)
        format.html { redirect_to root_path, notice: "therapist was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_therapist
    @therapist = Therapist.includes(:specialties).find(params[:id])
  end

  # redirect if someone manualy tries to change route
  def check_permission
    unless @therapist.user_id == current_user.id
      redirect_back(fallback_location: root_path,
        alert: "Error: Permission denied - Invalid User")
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def therapist_params
    params.require(:therapist).permit(:about_me, :hourly_rate, :profile_image, :user_id, :specialty_ids)
  end
end
