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

ActiveRecord::Schema.define(version: 2018_09_10_081221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "solutions", force: :cascade do |t|
    t.integer "sid"
    t.bigint "problem_id"
    t.text "desc"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["problem_id"], name: "index_solutions_on_problem_id"
  end

  create_table "stock_prices", id: false, force: :cascade do |t|
    t.string "symbol", limit: 20, null: false
    t.date "quote_date", null: false
    t.integer "price", null: false
  end

  add_foreign_key "problems", "problemsets"
  add_foreign_key "solutions", "problems"
end
