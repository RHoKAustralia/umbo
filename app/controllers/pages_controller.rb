class PagesController < ApplicationController
  before_action :check_signed_in, except: [:dashboard]
  before_action :check_admin, only: [:create_therapist_user, :new_therapist_user]

  def home
  end

  def dashboard
  end

  def create_admin
    user = User.new
    user.last_name = 'Pinzone'
    # user.email = 'francesca@umbo.com.au'
    user.email = 'jakub.jaroszewski@gmail.com'
    user.role = 0
    user.password = SecureRandom.base64
    user.first_name = 'Francesca'
    saved = user.save
    redirect_to root_path
  end

  def new_therapist_user
    @user = User.new
  end

  def create_therapist_user
    @user = User.new(user_params)
    @user.role = 0
    @user.password = SecureRandom.base64
    saved = @user.save
    if saved
      redirect_to root_path, notice: "Therapist was successfully created."
    else
      redirect_to root_path, alert: "Failed to create therapist"
    end
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

  def check_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone)
  end
end
