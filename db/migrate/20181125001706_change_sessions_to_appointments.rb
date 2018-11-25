class ChangeSessionsToAppointments < ActiveRecord::Migration[5.2]
  def change
    rename_table :sessions, :appointments
  end
end
