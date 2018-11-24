class PagesController < ApplicationController
  before_action :check_signed_in

  def home
  end

  private

  def check_signed_in

    if user_signed_in? and current_user.patient? and current_user.patient.nil?
      redirect_to new_patient_path
    elsif user_signed_in? and current_user.patient? and !current_user.patient.nil?
      redirect_to dashboard_path
    elsif user_signed_in? and current_user.therapist?
      redirect_to edit_therapist_path
    else
      redirect_to therapists_path
    end
  end
end
