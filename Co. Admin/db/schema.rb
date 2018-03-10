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

ActiveRecord::Schema.define(version: 20171127165317) do

  create_table "comments", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.date "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.integer "user_id"
    t.string "content"
    t.string "image"
    t.date "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_task_id"
  end

  create_table "daily_tasks", force: :cascade do |t|
    t.string "task_description"
    t.date "task_deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.boolean "completed"
    t.integer "completed_by"
    t.date "completed_on"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.string "notification_type"
    t.boolean "seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.integer "project_id"
    t.integer "sender_id"
    t.integer "daily_task_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "manager_email"
    t.string "tech"
    t.date "deadline"
    t.string "company_name"
  end

  create_table "user_project_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "contribution"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "register_as"
    t.string "company_name"
    t.string "ceo_email"
    t.string "manager_email"
    t.boolean "ceo"
    t.boolean "man"
    t.boolean "emp"
    t.string "account_type"
    t.boolean "paid"
    t.integer "num_of_managers"
    t.integer "num_of_employees"
    t.integer "num_of_allowed_managers"
    t.integer "num_of_allowed_employees"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_relations", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subordinate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
