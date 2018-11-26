class PagesController < ApplicationController
  before_action :check_signed_in, except: [:dashboard]

  def home
  end

  def dashboard
  end

  private

  def check_signed_in
    if user_signed_in? and current_user.patient?
      if current_user.patient.nil?
        redirect_to new_patient_path
      else
        redirect_to search_index_path
      end
    elsif user_signed_in? and current_user.therapist?
      redirect_to dashboard_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end
end
