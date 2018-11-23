class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
      t.references :user, foreign_key: true
      t.text :about_me
      t.integer :hourly_rate
      t.string :profile_image

      t.timestamps
    end
  end
end
