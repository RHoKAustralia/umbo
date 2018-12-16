class Patient < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :sessions
  has_many :patient_therapists
  has_many :therapists, through: :patient_therapists
  enum gender: {'male': 0, 'female': 1}
  has_many :patient_specialties
  has_many :specialties, through: :patient_specialties

  def age
    now = Time.now.utc.to_date
    now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end
end
