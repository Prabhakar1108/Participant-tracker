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

ActiveRecord::Schema[7.0].define(version: 2023_06_21_192313) do
  create_table "coordinators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.date "date_of_enrollment"
    t.string "method_of_contact"
    t.text "remarks"
    t.integer "coordinator_id", null: false
    t.integer "participant_id", null: false
    t.integer "registry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coordinator_id"], name: "index_enrollments_on_coordinator_id"
    t.index ["participant_id"], name: "index_enrollments_on_participant_id"
    t.index ["registry_id"], name: "index_enrollments_on_registry_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.date "date_of_birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registries", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "state"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "enrollments", "coordinators"
  add_foreign_key "enrollments", "participants"
  add_foreign_key "enrollments", "registries"
end
