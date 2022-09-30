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

ActiveRecord::Schema.define(version: 2022_09_26_065340) do

  create_table "completed_video_comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id"
    t.integer "completed_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_video_id"], name: "index_completed_video_comments_on_completed_video_id"
    t.index ["user_id"], name: "index_completed_video_comments_on_user_id"
  end

  create_table "completed_video_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "completed_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_video_id"], name: "index_completed_video_likes_on_completed_video_id"
    t.index ["user_id", "completed_video_id"], name: "index_completed_video_likes_on_user_id_and_completed_video_id", unique: true
    t.index ["user_id"], name: "index_completed_video_likes_on_user_id"
  end

  create_table "completed_video_loves", force: :cascade do |t|
    t.integer "user_id"
    t.integer "completed_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_video_id"], name: "index_completed_video_loves_on_completed_video_id"
    t.index ["user_id", "completed_video_id"], name: "index_completed_video_loves_on_user_id_and_completed_video_id", unique: true
    t.index ["user_id"], name: "index_completed_video_loves_on_user_id"
  end

  create_table "completed_videos", force: :cascade do |t|
    t.integer "user_video_id"
    t.integer "content_video_id"
    t.string "number", null: false
    t.string "video_url", null: false
    t.string "user_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_completed_videos_on_content_video_id"
    t.index ["user_video_id"], name: "index_completed_videos_on_user_video_id"
  end

  create_table "content_video_comments", force: :cascade do |t|
    t.text "body", null: false
    t.integer "user_id"
    t.integer "content_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_comments_on_content_video_id"
    t.index ["user_id"], name: "index_content_video_comments_on_user_id"
  end

  create_table "content_video_likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "content_video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_likes_on_content_video_id"
    t.index ["user_id", "content_video_id"], name: "index_content_video_likes_on_user_id_and_content_video_id", unique: true
    t.index ["user_id"], name: "index_content_video_likes_on_user_id"
  end

  create_table "content_video_loves", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_loves_on_content_video_id"
    t.index ["user_id", "content_video_id"], name: "index_content_video_loves_on_user_id_and_content_video_id", unique: true
    t.index ["user_id"], name: "index_content_video_loves_on_user_id"
  end

  create_table "content_video_tag_relations", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.integer "content_video_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_tag_relations_on_content_video_id"
    t.index ["tag_id"], name: "index_content_video_tag_relations_on_tag_id"
  end

  create_table "content_videos", force: :cascade do |t|
    t.string "number", null: false
    t.string "title", null: false
    t.text "description"
    t.string "youtube_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "user_videos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_video_id"
    t.string "number", null: false
    t.string "content_number", null: false
    t.string "video_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_user_videos_on_content_video_id"
    t.index ["user_id"], name: "index_user_videos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sub", null: false
  end

end
