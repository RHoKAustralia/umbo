class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :patient
  has_one :therapist

  enum role: ['admin', 'therapist', 'patient']

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :profile_image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :profile_image])
  end
end
