class Therapist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :therapist_specialties
  has_many :specialties, through: :therapist_specialties
  has_many :patient_therapists
  has_many :patients, through: :patient_therapists
  has_many :appointments
  mount_uploader :profile_image, ImageUploader
end
