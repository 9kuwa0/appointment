# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_11_27_105555) do
  create_table "families", charset: "utf8mb3", force: :cascade do |t|
    t.string "family_last_name", null: false
    t.string "family_first_name", null: false
    t.string "family_last_name_kana", null: false
    t.string "family_first_name_kana", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_families_on_email", unique: true
    t.index ["reset_password_token"], name: "index_families_on_reset_password_token", unique: true
  end

  create_table "patients", charset: "utf8mb3", force: :cascade do |t|
    t.integer "patient_number", null: false
    t.string "patient_last_name", null: false
    t.string "patient_first_name", null: false
    t.string "patient_last_name_kana", null: false
    t.string "patient_first_name_kana", null: false
    t.date "birthday", null: false
    t.integer "floor"
    t.integer "room"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "promises", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "family_id", null: false
    t.bigint "patient_id", null: false
    t.date "day", null: false
    t.integer "meeting_time_id", null: false
    t.datetime "start_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_id"], name: "index_promises_on_family_id"
    t.index ["patient_id"], name: "index_promises_on_patient_id"
  end

  create_table "staff_members", charset: "utf8mb3", force: :cascade do |t|
    t.integer "staff_number", null: false
    t.string "staff_last_name", null: false
    t.string "staff_first_name", null: false
    t.integer "staff_department_id", null: false
    t.integer "staff_affiliation_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staff_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staff_members_on_reset_password_token", unique: true
    t.index ["staff_number"], name: "index_staff_members_on_staff_number", unique: true
  end

  add_foreign_key "promises", "families"
  add_foreign_key "promises", "patients"
end
