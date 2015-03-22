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

ActiveRecord::Schema.define(version: 20150320161231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "access_token",              null: false
    t.integer  "user_scope_cd", default: 0, null: false
    t.datetime "expired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token", unique: true, using: :btree
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id", using: :btree

  create_table "board_activities", force: :cascade do |t|
    t.integer  "member_id",   null: false
    t.integer  "board_id",    null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_activities", ["board_id"], name: "index_board_activities_on_board_id", using: :btree

  create_table "board_members", force: :cascade do |t|
    t.integer  "board_id",                   null: false
    t.integer  "member_id",                  null: false
    t.boolean  "admin",      default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "board_members", ["board_id", "member_id"], name: "index_board_members_on_board_id_and_member_id", unique: true, using: :btree
  add_index "board_members", ["board_id"], name: "index_board_members_on_board_id", using: :btree

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug",                       null: false
    t.boolean  "open",        default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["open"], name: "index_boards_on_open", using: :btree

  create_table "card_activities", force: :cascade do |t|
    t.integer  "member_id",   null: false
    t.integer  "card_id",     null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_activities", ["card_id"], name: "index_card_activities_on_card_id", using: :btree

  create_table "card_comments", force: :cascade do |t|
    t.integer  "card_id",      null: false
    t.integer  "commenter_id", null: false
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_comments", ["card_id"], name: "index_card_comments_on_card_id", using: :btree

  create_table "card_members", force: :cascade do |t|
    t.integer  "card_id",    null: false
    t.integer  "member_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_members", ["card_id", "member_id"], name: "index_card_members_on_card_id_and_member_id", unique: true, using: :btree
  add_index "card_members", ["card_id"], name: "index_card_members_on_card_id", using: :btree

  create_table "cards", force: :cascade do |t|
    t.integer  "list_id",                      null: false
    t.string   "title",                        null: false
    t.text     "description"
    t.datetime "due_date"
    t.boolean  "open",          default: true, null: false
    t.integer  "comment_count", default: 0,    null: false
    t.string   "url"
    t.integer  "assignee_id"
    t.integer  "position"
    t.string   "company"
    t.integer  "salary",        default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["list_id"], name: "index_cards_on_list_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.integer  "board_id",                     null: false
    t.string   "title"
    t.string   "slug",                         null: false
    t.text     "description"
    t.boolean  "open",          default: true, null: false
    t.integer  "position",                     null: false
    t.text     "card_template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lists", ["board_id"], name: "index_lists_on_board_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "full_name"
    t.string   "session_key"
    t.string   "activation_key"
    t.string   "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_key"], name: "index_users_on_session_key", using: :btree

end
