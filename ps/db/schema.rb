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

ActiveRecord::Schema.define(version: 2018_11_04_061347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "picture"
    t.bigint "category_id"
    t.bigint "stall_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_dishes_on_category_id"
    t.index ["stall_id"], name: "index_dishes_on_stall_id"
    t.index ["user_id"], name: "index_dishes_on_user_id"
  end

  create_table "my_stocks", id: false, force: :cascade do |t|
    t.string "symbol", limit: 20, null: false
    t.integer "n_shares", null: false
    t.date "date_acquired", null: false
  end

  create_table "newly_acquired_stocks", id: false, force: :cascade do |t|
    t.string "symbol", limit: 20, null: false
    t.integer "n_shares", null: false
    t.date "date_acquired", null: false
  end

  create_table "problems", force: :cascade do |t|
    t.integer "pid"
    t.bigint "problemset_id"
    t.string "pname"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problemset_id"], name: "index_problems_on_problemset_id"
  end

  create_table "problemsets", force: :cascade do |t|
    t.integer "psid"
    t.string "psname"
    t.date "date_assign"
    t.date "date_due"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotations", force: :cascade do |t|
    t.string "author_name"
    t.string "category"
    t.text "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rate"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "dish_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.integer "sid"
    t.bigint "problem_id"
    t.text "desc"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_solutions_on_problem_id"
  end

  create_table "stalls", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "picture"
    t.string "latlog"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "owner"
    t.index ["user_id"], name: "index_stalls_on_user_id"
  end

  create_table "stock_prices", id: false, force: :cascade do |t|
    t.string "symbol", limit: 20, null: false
    t.date "quote_date", null: false
    t.integer "price", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.string "contactno"
    t.boolean "admin"
    t.boolean "stall"
    t.boolean "active"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_views_on_email", unique: true
    t.index ["reset_password_token"], name: "index_views_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "dishes", "categories"
  add_foreign_key "dishes", "stalls"
  add_foreign_key "dishes", "users"
  add_foreign_key "problems", "problemsets"
  add_foreign_key "solutions", "problems"
  add_foreign_key "stalls", "users"
end
