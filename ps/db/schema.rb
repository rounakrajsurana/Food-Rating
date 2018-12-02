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

ActiveRecord::Schema.define(version: 2018_12_02_142837) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

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

  create_table "log_ratings", force: :cascade do |t|
    t.integer "rating_id"
    t.integer "rate"
    t.string "comment"
    t.bigint "dish_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_log_ratings_on_dish_id"
    t.index ["user_id"], name: "index_log_ratings_on_user_id"
  end

#   create_table "my_stocks", id: false, force: :cascade do |t|
#     t.string "symbol", limit: 20, null: false
#     t.integer "n_shares", null: false
#     t.date "date_acquired", null: false
#   end
#
#   create_table "newly_acquired_stocks", id: false, force: :cascade do |t|
#     t.string "symbol", limit: 20, null: false
#     t.integer "n_shares", null: false
#     t.date "date_acquired", null: false
#   end
#
# >>>>>>> aeb
  create_table "orders", force: :cascade do |t|
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

  create_table "stalls", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "picture"
    t.string "latlog"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "owner"
    t.string "address"
    t.index ["user_id"], name: "index_stalls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "fullname", default: "", null: false
    t.string "contactno", default: "", null: false
    t.boolean "admin", default: false
    t.boolean "stall", default: false
    t.boolean "active", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "dishes", "categories"
  add_foreign_key "dishes", "stalls"
  add_foreign_key "dishes", "users"

  add_foreign_key "log_ratings", "dishes"
  add_foreign_key "log_ratings", "users"
  add_foreign_key "problems", "problemsets"
  add_foreign_key "solutions", "problems"

  add_foreign_key "stalls", "users"
end
