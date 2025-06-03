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

ActiveRecord::Schema[7.1].define(version: 2025_06_03_195136) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expertises", force: :cascade do |t|
    t.integer "tutor_rate"
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_expertises_on_subject_id"
    t.index ["user_id"], name: "index_expertises_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "format"
    t.string "summary"
    t.bigint "study_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["study_id"], name: "index_materials_on_study_id"
  end

  create_table "studies", force: :cascade do |t|
    t.string "learning_objective"
    t.bigint "user_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_studies_on_subject_id"
    t.index ["user_id"], name: "index_studies_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "grade_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "tutor"
    t.datetime "date_of_birth"
    t.string "bio"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "expertises", "subjects"
  add_foreign_key "expertises", "users"
  add_foreign_key "materials", "studies"
  add_foreign_key "studies", "subjects"
  add_foreign_key "studies", "users"
end
