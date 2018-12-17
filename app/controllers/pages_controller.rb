class PagesController < ApplicationController
  before_action :check_signed_in, except: [:dashboard]

  def home
  end

  def dashboard
    if current_user.patient?
      @patient = current_user.patient
    elsif current_user.therapist?
      @therapist = current_user.therapist
    end
  end

  private

  def check_signed_in
    if user_signed_in? and current_user.patient?
      if current_user.patient.nil?
        redirect_to new_patient_path
      elsif current_user.patient.therapists.empty?
        redirect_to search_index_path
      else
        redirect_to dashboard_path
      end
    elsif user_signed_in? and current_user.therapist?
      if current_user.therapist.nil?
        redirect_to new_therapist_path
      else
        redirect_to dashboard_path
      end
    end
  end
end
