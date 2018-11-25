class PagesController < ApplicationController
  before_action :check_signed_in, except: [:dashboard]

  def home
  end

  def dashboard
  end

  def create_admin
    user = User.new
    user.last_name = 'Pinzone'
    user.email = 'francesca@umbo.com.au'
    user.role = 0
    user.password = SecureRandom.base64
    user.first_name = 'Francesca'
    saved = user.save
    redirect_to root_path
  end

  private

  def check_signed_in
    if user_signed_in? and current_user.patient?
      if current_user.patient.nil?
        redirect_to new_patient_path
      else
        redirect_to dashboard_path
      end
    elsif user_signed_in? and current_user.therapist?
      redirect_to dashboard_path
    end
  end
end
