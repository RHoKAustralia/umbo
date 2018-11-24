class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to dashboard_path
    end
  end

  def dashboard
    # if current_user.therapist?
    #   @user = Therapist.find(current_user.therapist.id)
    # end
  end 
end
