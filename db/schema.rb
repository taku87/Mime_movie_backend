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

ActiveRecord::Schema.define(version: 2022_09_03_210644) do

  create_table "contents", force: :cascade do |t|
    t.integer "number"
    t.string "title", null: false
    t.text "description"
    t.string "category"
    t.string "video_url"
    t.integer "video_length"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["name"], name: "index_users_on_name"
  end

  create_table "users_videos", force: :cascade do |t|
    t.string "number"
    t.string "video_url"
    t.integer "content_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "transcoded_video_url"
    t.index ["user_id"], name: "index_users_videos_on_user_id"
  end

end