class AddColumnsToTherapists < ActiveRecord::Migration[5.2]
  def change
    add_column :therapists, :dob, :date
    add_column :therapists, :postcode, :string
    add_column :therapists, :gender, :integer
  end
end
