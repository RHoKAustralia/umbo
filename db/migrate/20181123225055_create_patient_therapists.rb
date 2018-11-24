class CreatePatientTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_therapists do |t|
      t.references :patient, foreign_key: true
      t.references :therapist, foreign_key: true

      t.timestamps
    end
  end
end
