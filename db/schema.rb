# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_26_082707) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
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

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "text"
    t.integer "user_id", null: false
    t.integer "stunning_view_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stunning_view_id"], name: "index_reviews_on_stunning_view_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "stunning_views", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "latitude"
    t.decimal "longitude"
    t.boolean "car_access"
    t.boolean "free_access"
    t.boolean "serviced"
    t.boolean "family_friendly"
    t.integer "overlooking"
    t.integer "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "featured", default: false
    t.integer "user_id", null: false
    t.integer "reviews_count", default: 0
    t.index ["city_id"], name: "index_stunning_views_on_city_id"
    t.index ["user_id"], name: "index_stunning_views_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.boolean "local_guide"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "reviews", "stunning_views"
  add_foreign_key "reviews", "users"
  add_foreign_key "stunning_views", "cities"
  add_foreign_key "stunning_views", "users"
end
