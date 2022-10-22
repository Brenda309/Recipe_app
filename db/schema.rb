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

<<<<<<< HEAD
ActiveRecord::Schema[7.0].define(version: 2022_10_04_153352) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "foods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.string "measurement_unit"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "recipe_foods", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recipe_id", null: false
    t.bigint "food_id", null: false
    t.index ["food_id"], name: "index_recipe_foods_on_food_id"
    t.index ["recipe_id"], name: "index_recipe_foods_on_recipe_id"
=======
ActiveRecord::Schema[7.0].define(version: 2022_10_22_082553) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "measurement_unit"
    t.float "price"
    t.string "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "recipe_food", force: :cascade do |t|
    t.float "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "recipe_id", null: false
    t.index ["food_id"], name: "index_recipe_food_on_food_id"
    t.index ["recipe_id"], name: "index_recipe_food_on_recipe_id"
>>>>>>> a57e6e05b52911793ac265c89d37e5e725b792f4
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
<<<<<<< HEAD
    t.string "description"
    t.integer "preparation_time"
    t.integer "cooking_time"
    t.boolean "public"
=======
    t.time "preparation_time"
    t.time "cooking_time"
    t.string "description"
    t.string "text"
    t.string "public"
    t.string "boolean"
>>>>>>> a57e6e05b52911793ac265c89d37e5e725b792f4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
<<<<<<< HEAD
=======
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> a57e6e05b52911793ac265c89d37e5e725b792f4
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
<<<<<<< HEAD
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
=======
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
>>>>>>> a57e6e05b52911793ac265c89d37e5e725b792f4
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  add_foreign_key "foods", "users"
  add_foreign_key "recipe_foods", "foods"
  add_foreign_key "recipe_foods", "recipes"
=======
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "foods", "users"
  add_foreign_key "recipe_food", "foods"
  add_foreign_key "recipe_food", "recipes"
>>>>>>> a57e6e05b52911793ac265c89d37e5e725b792f4
  add_foreign_key "recipes", "users"
end
