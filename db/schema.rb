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

ActiveRecord::Schema.define(version: 2022_10_31_013428) do

  create_table "completed_video_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "completed_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_video_id"], name: "index_completed_video_comments_on_completed_video_id"
    t.index ["user_id"], name: "index_completed_video_comments_on_user_id"
  end

  create_table "completed_video_likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "completed_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["completed_video_id"], name: "index_completed_video_likes_on_completed_video_id"
    t.index ["user_id"], name: "index_completed_video_likes_on_user_id"
  end

  create_table "completed_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_video_id"
    t.bigint "content_video_id"
    t.string "number", null: false
    t.string "video_url", null: false
    t.string "user_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_completed_videos_on_content_video_id"
    t.index ["user_video_id"], name: "index_completed_videos_on_user_video_id"
  end

  create_table "content_video_comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "content_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_comments_on_content_video_id"
    t.index ["user_id"], name: "index_content_video_comments_on_user_id"
  end

  create_table "content_video_likes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "content_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_likes_on_content_video_id"
    t.index ["user_id"], name: "index_content_video_likes_on_user_id"
  end

  create_table "content_video_tag_relations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "content_video_type", default: 0, null: false
    t.bigint "tag_id"
    t.bigint "content_video_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_content_video_tag_relations_on_content_video_id"
    t.index ["tag_id"], name: "index_content_video_tag_relations_on_tag_id"
  end

  create_table "content_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "number", null: false
    t.string "title", null: false
    t.text "description"
    t.string "thumbnail"
    t.string "youtube_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "published_at"
    t.integer "state", default: 0
  end

  create_table "tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_videos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "content_video_id"
    t.string "number", null: false
    t.string "content_number", null: false
    t.string "video_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_video_id"], name: "index_user_videos_on_content_video_id"
    t.index ["user_id"], name: "index_user_videos_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "sub"
    t.string "name"
    t.string "email"
    t.string "avatar"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "completed_video_comments", "completed_videos"
  add_foreign_key "completed_video_comments", "users"
  add_foreign_key "completed_video_likes", "completed_videos"
  add_foreign_key "completed_video_likes", "users"
  add_foreign_key "completed_videos", "content_videos"
  add_foreign_key "completed_videos", "user_videos"
  add_foreign_key "content_video_comments", "content_videos"
  add_foreign_key "content_video_comments", "users"
  add_foreign_key "content_video_likes", "content_videos"
  add_foreign_key "content_video_likes", "users"
  add_foreign_key "content_video_tag_relations", "content_videos"
  add_foreign_key "content_video_tag_relations", "tags"
  add_foreign_key "user_videos", "content_videos"
  add_foreign_key "user_videos", "users"
end
