class TherapistSpecialty < ApplicationRecord
  belongs_to :therapist, dependent: :destroy
  belongs_to :specialty, dependent: :destroy
end
