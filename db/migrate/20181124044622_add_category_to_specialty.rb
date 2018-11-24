class AddCategoryToSpecialty < ActiveRecord::Migration[5.2]
  def change
    add_column :specialties, :category, :integer
  end
end
