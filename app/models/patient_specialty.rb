class PatientSpecialty < ApplicationRecord
  belongs_to :patient
  belongs_to :specialty
end
