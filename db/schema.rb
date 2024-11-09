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

ActiveRecord::Schema[7.0].define(version: 2024_11_09_023021) do
  create_table "staff_members", charset: "utf8mb3", force: :cascade do |t|
    t.integer "staff_number", null: false
    t.string "staff_last_name", null: false
    t.string "staff_first_name", null: false
    t.integer "staff_department", null: false
    t.integer "staff_affiliation", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_staff_members_on_reset_password_token", unique: true
    t.index ["staff_number"], name: "index_staff_members_on_staff_number", unique: true
  end

end
