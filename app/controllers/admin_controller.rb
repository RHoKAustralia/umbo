class AdminController < ApplicationController
  before_action :check_admin

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

  def check_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end