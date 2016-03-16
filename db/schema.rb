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

ActiveRecord::Schema.define(version: 20160316101142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "phone_number"
    t.string   "city"
    t.string   "address"
    t.string   "photo"
  end

  add_index "clients", ["email"], name: "index_clients_on_email", unique: true, using: :btree
  add_index "clients", ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree

  create_table "developers", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "city"
    t.string   "address"
    t.string   "photo"
    t.integer  "price_per_hour"
    t.string   "expertise"
    t.string   "availability"
  end

  add_index "developers", ["email"], name: "index_developers_on_email", unique: true, using: :btree
  add_index "developers", ["reset_password_token"], name: "index_developers_on_reset_password_token", unique: true, using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.integer  "developer_id"
    t.integer  "job_id"
    t.text     "motivation"
    t.string   "status",       default: "Pending"
    t.integer  "price"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "job_applications", ["developer_id"], name: "index_job_applications_on_developer_id", using: :btree
  add_index "job_applications", ["job_id"], name: "index_job_applications_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "difficulty_level"
    t.integer  "budget"
    t.string   "duration"
    t.date     "start_date"
    t.date     "deadline"
    t.string   "request_type"
    t.string   "status",           default: "Open"
    t.integer  "client_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "jobs", ["client_id"], name: "index_jobs_on_client_id", using: :btree

  create_table "programming_languages", force: :cascade do |t|
    t.string   "name"
    t.integer  "developer_id"
    t.integer  "level"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "programming_languages", ["developer_id"], name: "index_programming_languages_on_developer_id", using: :btree

  create_table "recommendations", force: :cascade do |t|
    t.text     "content"
    t.integer  "author_id"
    t.string   "author_type"
    t.integer  "developer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "recommendations", ["author_type", "author_id"], name: "index_recommendations_on_author_type_and_author_id", using: :btree
  add_index "recommendations", ["developer_id"], name: "index_recommendations_on_developer_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "description"
    t.integer  "author_id"
    t.string   "author_type"
    t.integer  "job_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["author_type", "author_id"], name: "index_reviews_on_author_type_and_author_id", using: :btree
  add_index "reviews", ["job_id"], name: "index_reviews_on_job_id", using: :btree

  create_table "tools", force: :cascade do |t|
    t.string   "name"
    t.integer  "developer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tools", ["developer_id"], name: "index_tools_on_developer_id", using: :btree

  create_table "works", force: :cascade do |t|
    t.string   "title"
    t.integer  "developer_id"
    t.text     "description"
    t.string   "photo"
    t.string   "client_name"
    t.string   "website_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "works", ["developer_id"], name: "index_works_on_developer_id", using: :btree

  add_foreign_key "job_applications", "developers"
  add_foreign_key "job_applications", "jobs"
  add_foreign_key "jobs", "clients"
  add_foreign_key "programming_languages", "developers"
  add_foreign_key "recommendations", "developers"
  add_foreign_key "reviews", "jobs"
  add_foreign_key "tools", "developers"
  add_foreign_key "works", "developers"
end
