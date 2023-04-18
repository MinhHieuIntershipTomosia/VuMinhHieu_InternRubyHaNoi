# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_17_103550) do
  create_table "active_storage_attachments", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.string "comment_content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "thanks_card_id", null: false
    t.index ["thanks_card_id"], name: "index_comments_on_thanks_card_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "thanks_cards", charset: "utf8mb3", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.text "description"
    t.bigint "category_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delete_status", default: false
    t.index ["category_id"], name: "index_thanks_cards_on_category_id"
    t.index ["user_id"], name: "index_thanks_cards_on_user_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "full_name"
    t.string "image"
    t.string "email"
    t.string "phoneNumber"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_remember_token"
    t.string "activation_remember_token"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phoneNumber"], name: "index_users_on_phoneNumber", unique: true
  end

  create_table "users_receivers", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "thanks_card_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "delete_status", default: false
    t.boolean "users_receivers_delete", default: false
    t.index ["thanks_card_id"], name: "index_users_receivers_on_thanks_card_id"
    t.index ["user_id"], name: "index_users_receivers_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "thanks_cards"
  add_foreign_key "comments", "users"
  add_foreign_key "thanks_cards", "categories"
  add_foreign_key "thanks_cards", "users"
  add_foreign_key "users_receivers", "thanks_cards"
  add_foreign_key "users_receivers", "users"
end
