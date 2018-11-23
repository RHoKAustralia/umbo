class ApplicationController < ActionController::Base

  def fullname
    @fullname = current_user.first_name + " " + current_user.last_name
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :profile_image])
  end
end
