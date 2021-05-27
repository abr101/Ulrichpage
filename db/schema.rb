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

ActiveRecord::Schema.define(version: 2021_05_27_184718) do

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

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "country_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "continent_translations", force: :cascade do |t|
    t.bigint "continent_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["continent_id"], name: "index_continent_translations_on_continent_id"
    t.index ["locale"], name: "index_continent_translations_on_locale"
  end

  create_table "continents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "continent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dashboards", force: :cascade do |t|
    t.text "description"
    t.integer "page_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_ads", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "location"
    t.string "phone"
    t.string "keywords"
    t.string "email"
    t.boolean "get_response"
    t.boolean "terms_privacy"
    t.string "images"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.json "avatars"
    t.integer "sub_category_id"
    t.integer "category_id"
    t.integer "city_id"
    t.integer "country_id"
    t.integer "status", default: 0
    t.integer "price"
    t.boolean "negotiable"
    t.boolean "personal"
    t.boolean "business"
    t.string "zipcode"
  end

  create_table "replies", force: :cascade do |t|
    t.text "text"
    t.bigint "user_id"
    t.bigint "post_ad_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_ad_id"], name: "index_replies_on_post_ad_id"
    t.index ["user_id"], name: "index_replies_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_ad_id"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_ad_id"], name: "index_reports_on_post_ad_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_informations", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "zipcode"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_informations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.json "avatars"
    t.string "stripe_token"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "replies", "post_ads"
  add_foreign_key "replies", "users"
  add_foreign_key "reports", "post_ads"
  add_foreign_key "reports", "users"
  add_foreign_key "user_informations", "users"
end
