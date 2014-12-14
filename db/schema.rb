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

ActiveRecord::Schema.define(version: 20141214173906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buckets", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "posts", force: true do |t|
    t.string   "portal"
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "related_posts", force: true do |t|
    t.integer  "post_id"
    t.integer  "bucket_id"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "related_posts", ["bucket_id"], name: "index_related_posts_on_bucket_id", using: :btree
  add_index "related_posts", ["post_id"], name: "index_related_posts_on_post_id", using: :btree

  create_table "tag_posts", force: true do |t|
    t.integer  "tag_id"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tag_posts", ["post_id"], name: "index_tag_posts_on_post_id", using: :btree
  add_index "tag_posts", ["tag_id"], name: "index_tag_posts_on_tag_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "term"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
