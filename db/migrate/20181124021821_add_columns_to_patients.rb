class AddColumnsToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :dob, :date
    add_column :patients, :gender, :integer
    add_column :patients, :ndis_status, :boolean
    add_column :patients, :ndis_number, :string
    add_column :patients, :postcode, :string
  end
end
