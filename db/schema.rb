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

ActiveRecord::Schema.define(version: 20221123092754) do

  create_table "bookings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "contact_no"
    t.string "guardian_name"
    t.string "guardian_contact_no"
    t.string "address"
    t.integer "room_no"
    t.integer "duration"
    t.string "country"
    t.string "organization"
    t.string "addhar_no"
    t.boolean "registration_fees", default: false
    t.boolean "coation_mony", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hostels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "name"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "about"
    t.index ["user_id"], name: "index_hostels_on_user_id"
  end

  create_table "protocols", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "discription"
    t.bigint "hostel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_protocols_on_hostel_id"
  end

  create_table "rooms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.integer "seater"
    t.decimal "fees", precision: 10
    t.integer "room_no"
    t.bigint "hostel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_rooms_on_hostel_id"
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.boolean "food"
    t.integer "electricity_charges"
    t.bigint "hostel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hostel_id"], name: "index_services_on_hostel_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.bigint "contact_no"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
