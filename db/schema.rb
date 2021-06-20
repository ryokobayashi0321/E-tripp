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

ActiveRecord::Schema.define(version: 2021_06_20_055629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["spot_id"], name: "index_likes_on_spot_id"
    t.index ["user_id", "spot_id"], name: "index_likes_on_user_id_and_spot_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title", null: false
    t.date "day", null: false
    t.text "note"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "prefecture_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.time "specified_time"
    t.bigint "plan_id", null: false
    t.bigint "spot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id", "spot_id"], name: "index_schedules_on_plan_id_and_spot_id", unique: true
    t.index ["plan_id"], name: "index_schedules_on_plan_id"
    t.index ["spot_id"], name: "index_schedules_on_spot_id"
  end

  create_table "spots", force: :cascade do |t|
    t.string "spot_name", null: false
    t.text "content", null: false
    t.string "photo", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "likes_count", default: 0
    t.index ["prefecture_id"], name: "index_spots_on_prefecture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.string "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "likes", "spots"
  add_foreign_key "likes", "users"
  add_foreign_key "plans", "users"
  add_foreign_key "schedules", "plans"
  add_foreign_key "schedules", "spots"
  add_foreign_key "spots", "prefectures"
end
