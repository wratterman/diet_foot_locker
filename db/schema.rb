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

ActiveRecord::Schema.define(version: 20170721150513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "sneaker_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sneaker_id"], name: "index_reviews_on_sneaker_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sneakers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.decimal "price"
    t.string "footlocker_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "brand_id"
    t.bigint "sport_id"
    t.index ["brand_id"], name: "index_sneakers_on_brand_id"
    t.index ["sport_id"], name: "index_sneakers_on_sport_id"
  end

  create_table "sneakers_users", id: false, force: :cascade do |t|
    t.bigint "sneaker_id", null: false
    t.bigint "user_id", null: false
    t.index ["sneaker_id", "user_id"], name: "index_sneakers_users_on_sneaker_id_and_user_id"
    t.index ["user_id", "sneaker_id"], name: "index_sneakers_users_on_user_id_and_sneaker_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0
  end

  add_foreign_key "reviews", "sneakers"
  add_foreign_key "reviews", "users"
  add_foreign_key "sneakers", "brands"
  add_foreign_key "sneakers", "sports"
end
