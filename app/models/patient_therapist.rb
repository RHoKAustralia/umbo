class PatientTherapist < ApplicationRecord
  belongs_to :patient
  belongs_to :therapist
end
