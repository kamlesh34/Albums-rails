# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151104042902) do

  create_table "albums", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "albums", ["user_id"], name: "index_albums_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "sharing_id"
    t.string   "comment"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["sharing_id"], name: "index_comments_on_sharing_id"

  create_table "likes", force: :cascade do |t|
    t.string   "author"
    t.integer  "sharing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["sharing_id"], name: "index_likes_on_sharing_id"

  create_table "photos", force: :cascade do |t|
    t.string   "title"
    t.integer  "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "snaps"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id"

  create_table "photos_sharings", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "sharing_id"
  end

  add_index "photos_sharings", ["photo_id"], name: "index_photos_sharings_on_photo_id"
  add_index "photos_sharings", ["sharing_id"], name: "index_photos_sharings_on_sharing_id"

  create_table "photos_tags", id: false, force: :cascade do |t|
    t.integer "photo_id"
    t.integer "tag_id"
  end

  add_index "photos_tags", ["photo_id"], name: "index_photos_tags_on_photo_id"
  add_index "photos_tags", ["tag_id"], name: "index_photos_tags_on_tag_id"

  create_table "sharings", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sharings", ["user_id"], name: "index_sharings_on_user_id"

  create_table "tags", force: :cascade do |t|
    t.string   "tname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "tags", ["user_id"], name: "index_tags_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "provider"
    t.string   "uid"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
