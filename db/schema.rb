# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_06_140059) do

  create_table "diaries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "title"
    t.datetime "fish_at"
    t.string "fish_name"
    t.decimal "size", precision: 10
    t.decimal "weight", precision: 10
    t.string "count"
    t.string "photo"
    t.string "place"
    t.string "place_detail"
    t.float "diary_latitude"
    t.float "diary_longitude"
    t.string "area"
    t.string "range"
    t.string "tackle_action"
    t.string "speed"
    t.text "situation"
    t.text "diary_note"
    t.string "publish"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "tel"
    t.string "prefecture"
    t.string "image"
    t.string "main_genre1"
    t.string "main_genre2"
    t.string "main_genre3"
    t.text "introduction"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
