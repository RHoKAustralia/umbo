class Schedule < ApplicationRecord
  belongs_to :therapist, dependent: :destroy
end
