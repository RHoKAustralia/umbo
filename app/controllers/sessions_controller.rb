class SessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_session, only: [:show, :edit, :update, :destroy]
  before_action :set_therapist, only: [:new, :create, :index]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.where(therapist_id: @therapist.id).includes(:patient, therapist: :user)
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    time1 = Date.new(2019,1,1).to_time + 9.hours
    times = [time1]
    32.times do |i|
      time1 += 15.minutes
      times << time1
    end
    @time_strings = times.map { |t| t.strftime("%l:%M%p") }
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)
    @session.patient_id = current_user.id
    @session.therapist_id = params[:therapist_id]

    respond_to do |format|
      if @session.save
        format.html { redirect_to therapist_session_path(id: @session.id, therapist_id: @session.therapist_id), notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    p @session
    byebug
    @session.destroy
    respond_to do |format|
      format.html { redirect_to therapist_sessions_url(therapist_id: params[:therapist_id]), notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    def set_therapist
      @therapist = Therapist.find(params[:therapist_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:patient_id, :therapist_id, :date, :start_time, :end_time, :payment_date, :total_cost)
    end
end