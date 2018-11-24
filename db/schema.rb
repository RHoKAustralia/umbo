# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_24_021548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patient_therapists", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "therapist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_therapists_on_patient_id"
    t.index ["therapist_id"], name: "index_patient_therapists_on_therapist_id"
  end

  create_table "patients", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "therapist_id"
    t.date "day"
    t.time "time"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["therapist_id"], name: "index_schedules_on_therapist_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "therapist_id"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.date "payment_date"
    t.integer "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_sessions_on_patient_id"
    t.index ["therapist_id"], name: "index_sessions_on_therapist_id"
  end

  create_table "specialties", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "therapist_specialties", force: :cascade do |t|
    t.bigint "therapist_id"
    t.bigint "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["specialty_id"], name: "index_therapist_specialties_on_specialty_id"
    t.index ["therapist_id"], name: "index_therapist_specialties_on_therapist_id"
  end

  create_table "therapists", force: :cascade do |t|
    t.bigint "user_id"
    t.text "about_me"
    t.integer "hourly_rate"
    t.string "profile_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_therapists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.integer "role", default: 2
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "patient_therapists", "patients"
  add_foreign_key "patient_therapists", "therapists"
  add_foreign_key "patients", "users"
  add_foreign_key "schedules", "therapists"
  add_foreign_key "sessions", "patients"
  add_foreign_key "sessions", "therapists"
  add_foreign_key "therapist_specialties", "specialties"
  add_foreign_key "therapist_specialties", "therapists"
  add_foreign_key "therapists", "users"
end
