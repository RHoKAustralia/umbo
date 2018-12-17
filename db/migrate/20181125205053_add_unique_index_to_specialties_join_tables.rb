class AddUniqueIndexToSpecialtiesJoinTables < ActiveRecord::Migration[5.2]
  def change
    add_index :patient_specialties, [ :patient_id, :specialty_id ], :unique => true, :name => 'by_specialty_and_patient'
    add_index :therapist_specialties, [ :therapist_id, :specialty_id ], :unique => true, :name => 'by_specialty_and_therapist'
  end
end
