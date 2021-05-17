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

ActiveRecord::Schema.define(version: 2021_05_17_164138) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.integer "stock_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items_carts", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "cart_item_id", null: false
    t.index ["cart_item_id", "cart_id"], name: "index_cart_items_carts_on_cart_item_id_and_cart_id", unique: true
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts_cart_items", id: false, force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "cart_item_id", null: false
    t.index ["cart_id", "cart_item_id"], name: "index_carts_cart_items_on_cart_id_and_cart_item_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_products", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "product_id", null: false
    t.index ["category_id", "product_id"], name: "index_categories_products_on_category_id_and_product_id", unique: true
  end

  create_table "ppictures", force: :cascade do |t|
    t.string "photoURL"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["photoURL"], name: "index_ppictures_on_photoURL", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_savedlists", id: false, force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "savedlist_id", null: false
    t.index ["product_id", "savedlist_id"], name: "index_products_savedlists_on_product_id_and_savedlist_id", unique: true
  end

  create_table "savedlists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "product_id"
    t.string "colour"
    t.string "size"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "colour", "size"], name: "index_stocks_on_product_id_and_colour_and_size", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "savedlist_id"
    t.integer "cart_id"
    t.string "email"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
