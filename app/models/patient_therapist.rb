class PatientTherapist < ApplicationRecord
  belongs_to :patient, dependent: :destroy
  belongs_to :therapist, dependent: :destroy
end
