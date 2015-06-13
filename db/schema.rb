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

ActiveRecord::Schema.define(version: 20150613185826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "goals", force: :cascade do |t|
    t.string   "description"
    t.integer  "user_id"
    t.integer  "life_area_id"
    t.integer  "term_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completed",    default: false
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id", using: :btree

  create_table "life_areas", force: :cascade do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "links", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "excerpt"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "user_id"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string  "name"
    t.string  "section_type"
    t.integer "project_id"
  end

  add_index "sections", ["project_id"], name: "index_sections_on_project_id", using: :btree

  create_table "snippets", force: :cascade do |t|
    t.integer "project_id"
    t.string  "url"
    t.string  "title"
    t.string  "excerpt"
  end

  add_index "snippets", ["project_id"], name: "index_snippets_on_project_id", using: :btree

  create_table "terms", force: :cascade do |t|
    t.integer "days"
    t.string  "name"
  end

  create_table "todos", force: :cascade do |t|
    t.string  "description"
    t.integer "project_id"
    t.boolean "completed"
  end

  add_index "todos", ["project_id"], name: "index_todos_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
