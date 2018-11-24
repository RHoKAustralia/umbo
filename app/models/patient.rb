class Patient < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :sessions
  has_many :patient_therapists
  has_many :therapists, through: :patient_therapists
  has_many :specialties, through: :patient_specialties
end
