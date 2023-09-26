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

ActiveRecord::Schema[7.0].define(version: 2023_09_21_180247) do
  create_table "attorney_lawsuits", force: :cascade do |t|
    t.integer "Attorney_id", null: false
    t.integer "Lawsuit_id", null: false
    t.string "role"
    t.string "clt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Attorney_id"], name: "index_attorney_lawsuits_on_Attorney_id"
    t.index ["Lawsuit_id"], name: "index_attorney_lawsuits_on_Lawsuit_id"
  end

  create_table "attorneys", force: :cascade do |t|
    t.string "sbn"
    t.string "status"
    t.string "name"
    t.string "firm"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_lawsuits", force: :cascade do |t|
    t.integer "Client_id", null: false
    t.integer "Lawsuit_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Client_id"], name: "index_client_lawsuits_on_Client_id"
    t.index ["Lawsuit_id"], name: "index_client_lawsuits_on_Lawsuit_id"
  end

  create_table "clients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "fname"
    t.string "mname"
    t.string "lname"
    t.string "dob"
    t.string "ssn"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "ec_name"
    t.string "ec_phone"
    t.string "ec_email"
    t.string "dln"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "jcfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "journals", force: :cascade do |t|
    t.date "event_date"
    t.text "description"
    t.string "binder"
    t.string "note"
    t.decimal "cost"
    t.integer "Lawsuit_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Lawsuit_id"], name: "index_journals_on_Lawsuit_id"
  end

  create_table "lawsuits", force: :cascade do |t|
    t.integer "user_id", null: false
    t.boolean "active"
    t.string "case_number"
    t.string "case_title"
    t.date "date_filed"
    t.date "cmc"
    t.string "judge_name"
    t.string "judge_dept"
    t.string "case_status"
    t.string "last_roa"
    t.string "plt_caption"
    t.string "def_caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "plaintiff"
    t.string "atty_for"
    t.string "defendant"
    t.date "trc"
    t.date "trial"
    t.date "discovery_cutoff"
    t.date "first_expert_exchange"
    t.date "second_expert_exchange"
    t.index ["user_id"], name: "index_lawsuits_on_user_id"
  end

  create_table "ncfs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "scrapes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "sbn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "fname"
    t.string "lname"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "phone"
    t.string "firm"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attorney_lawsuits", "Attorneys"
  add_foreign_key "attorney_lawsuits", "Lawsuits"
  add_foreign_key "client_lawsuits", "Clients"
  add_foreign_key "client_lawsuits", "Lawsuits"
  add_foreign_key "clients", "users"
  add_foreign_key "journals", "Lawsuits"
  add_foreign_key "lawsuits", "users"
end
