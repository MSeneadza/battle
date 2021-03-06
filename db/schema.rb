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

ActiveRecord::Schema.define(version: 20140827030652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "hashtags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hashtags", ["name"], name: "index_hashtags_on_name", using: :btree

  create_table "mentions", force: true do |t|
    t.integer  "hashtag_id",                null: false
    t.string   "message",                   null: false
    t.datetime "published_at",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tweet_id",        limit: 8, null: false
    t.integer  "twitter_user_id", limit: 8
  end

  add_index "mentions", ["created_at"], name: "index_mentions_on_created_at", using: :btree
  add_index "mentions", ["hashtag_id", "tweet_id"], name: "index_mentions_on_hashtag_id_and_tweet_id", unique: true, using: :btree
  add_index "mentions", ["hashtag_id"], name: "index_mentions_on_hashtag_id", using: :btree
  add_index "mentions", ["published_at"], name: "index_mentions_on_published_at", using: :btree
  add_index "mentions", ["tweet_id"], name: "index_mentions_on_tweet_id", using: :btree
  add_index "mentions", ["twitter_user_id"], name: "index_mentions_on_twitter_user_id", using: :btree

  create_table "tag_battles", force: true do |t|
    t.integer  "user_id",                  null: false
    t.integer  "tag1_id",                  null: false
    t.integer  "tag2_id",                  null: false
    t.string   "description", default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_battles", ["tag1_id"], name: "index_tag_battles_on_tag1_id", using: :btree
  add_index "tag_battles", ["tag2_id"], name: "index_tag_battles_on_tag2_id", using: :btree
  add_index "tag_battles", ["user_id"], name: "index_tag_battles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
