class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  def date_select
    @unavailable_days = [];
    # @unavailable_days = UnavailableDay.where(listing_id: @listing.id).pluck(:day)
    @therapist = Therapist.find(params[:therapist_id])
  end

  def time_select
    @date = params['date']
    next_time = @date.to_time + 8.hours
    @times2DArray = [[next_time]]
    10.times do
      next_time += 1.hour
      @times2DArray[0] << next_time
    end
    (1..3).each do |i|
      @times2DArray[i] = @times2DArray[i-1].map { |t| t + 15.minutes }
    end
    next_time = @date.to_time + 8.hours
    @timesArray = [next_time]
    43.times do
      next_time += 15.minutes
      @timesArray << next_time
    end
    @unavailable_times = [];
    # @unavailable_days = UnavailableDay.where(listing_id: @listing.id).pluck(:day)
    @therapist = Therapist.find(params[:therapist_id])
    @appointment = Appointment.new
    if params['start_time']
      @appointment.start_time = params['start_time']
    end
  end

  # GET /appointments/new
  def new
    p params
    start_time = parse_time_params(params[:appointment], :start_time)
    @duration = params[:appointment][:duration].to_i
    end_time = start_time + @duration.minutes
    date = params[:appointment][:date].to_date
    byebug
    @therapist = Therapist.find(params[:therapist_id])
    @appointment = Appointment.new(
      date: date,
      start_time: start_time.strftime("%H:%M"),
      end_time: end_time.strftime("%H:%M")
    )
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    p params
    byebug
    @appointment = Appointment.new(appointment_params)
    @appointment.therapist_id = params[:therapist_id]
    @appointment.patient_id = current_user.patient.id
    @appointment.total_cost = (@appointment.end_time - @appointment.start_time) / 3600 * 180

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to root_path, notice: 'Appointment was successfully created.' }
        # format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        # format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date, :start_time, :end_time)
    end

    def parse_time_params params, label
      begin
        year   = params[(label.to_s + '(1i)').to_sym].to_i
        month  = params[(label.to_s + '(2i)').to_sym].to_i
        day   = params[(label.to_s + '(3i)').to_sym].to_i
        hour   = (params[(label.to_s + '(4i)').to_sym] || 0).to_i
        minute = (params[(label.to_s + '(5i)').to_sym] || 0).to_i

        return Time.new(year,month,day,hour,minute)
      rescue => e
        return nil
      end
    end
end