class CreatePatientSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :patient_specialties do |t|
      t.references :patient, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
