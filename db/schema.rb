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

ActiveRecord::Schema.define(version: 20150626075904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pairings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pair_id"
    t.integer  "user_id"
    t.integer  "cohort_id"
  end

  add_index "pairings", ["cohort_id"], name: "index_pairings_on_cohort_id", using: :btree
  add_index "pairings", ["user_id"], name: "index_pairings_on_user_id", using: :btree

  create_table "reasons", force: :cascade do |t|
    t.integer  "pair_id"
    t.string   "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "reasons", ["user_id"], name: "index_reasons_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "full_name"
    t.string   "profile_picture"
    t.string   "slack_username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cohort_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["cohort_id"], name: "index_users_on_cohort_id", using: :btree

  add_foreign_key "pairings", "cohorts"
  add_foreign_key "pairings", "users"
  add_foreign_key "reasons", "users"
  add_foreign_key "users", "cohorts"
end
