class TherapistSpecialty < ApplicationRecord
  belongs_to :therapist
  belongs_to :specialty
end
