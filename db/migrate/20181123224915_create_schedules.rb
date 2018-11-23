class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :therapist, foreign_key: true
      t.date :day
      t.time :time
      t.boolean :available

      t.timestamps
    end
  end
end
