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

ActiveRecord::Schema.define(version: 2020_03_03_145841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laptop_specs", force: :cascade do |t|
    t.string "ram"
    t.string "hdd"
    t.string "processor", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "laptop_id"
  end

  create_table "laptops", force: :cascade do |t|
    t.text "brand"
    t.text "name"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand"], name: "index_laptops_on_brand"
  end

  create_table "order_products", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "laptop_id"
    t.bigint "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "payment_status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.text "status"
    t.string "tracking_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "username"
    t.text "password"
    t.text "email"
    t.text "phoneno"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "password_confirmation"
    t.boolean "is_deleted", default: false
  end

  add_foreign_key "laptop_specs", "laptops"
  add_foreign_key "order_products", "laptops"
  add_foreign_key "order_products", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "shipments", "orders"
end
