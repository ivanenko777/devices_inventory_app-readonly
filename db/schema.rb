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

ActiveRecord::Schema.define(version: 2020_12_04_140543) do

  create_table "device_manufacturers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_models", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.bigint "device_manufacturer_id"
    t.bigint "device_type_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_manufacturer_id"], name: "index_device_models_on_device_manufacturer_id"
    t.index ["device_type_id", "device_manufacturer_id", "name"], name: "index_device_models_unique_model", unique: true
    t.index ["device_type_id"], name: "index_device_models_on_device_type_id"
  end

  create_table "device_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "sys_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sys_name"], name: "index_device_types_on_sys_name", unique: true
  end

  create_table "devices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "device_model_id"
    t.bigint "room_id"
    t.string "asset_no"
    t.string "serial_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "created_by_id"
    t.integer "updated_by_id"
    t.index ["created_by_id"], name: "index_devices_on_created_by_id"
    t.index ["device_model_id", "serial_no"], name: "index_devices_on_device_model_id_and_serial_no", unique: true
    t.index ["device_model_id"], name: "index_devices_on_device_model_id"
    t.index ["room_id"], name: "index_devices_on_room_id"
    t.index ["status"], name: "index_devices_on_status"
    t.index ["updated_by_id"], name: "index_devices_on_updated_by_id"
  end

  create_table "offices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "office_id"
    t.string "name"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["office_id"], name: "index_rooms_on_office_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "logged_in_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "device_models", "device_manufacturers"
  add_foreign_key "device_models", "device_types"
  add_foreign_key "devices", "device_models"
  add_foreign_key "devices", "rooms"
  add_foreign_key "rooms", "offices"
end
