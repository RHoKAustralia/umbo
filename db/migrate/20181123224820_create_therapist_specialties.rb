class CreateTherapistSpecialties < ActiveRecord::Migration[5.2]
  def change
    create_table :therapist_specialties do |t|
      t.references :therapist, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
