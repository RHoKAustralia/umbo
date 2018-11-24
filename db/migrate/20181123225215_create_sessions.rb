class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :patient, foreign_key: true
      t.references :therapist, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.date :payment_date
      t.integer :total_cost

      t.timestamps
    end
  end
end
