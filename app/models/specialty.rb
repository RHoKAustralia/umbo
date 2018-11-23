class Specialty < ApplicationRecord
  has_many :therapist_specialties
  has_many :therapists, through: :therapist_specialties
end
