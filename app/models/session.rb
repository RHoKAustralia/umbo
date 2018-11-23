class Session < ApplicationRecord
  belongs_to :patient
  belongs_to :therapist
end
