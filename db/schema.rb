# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150705165219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ebay_return_policies", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "refund_option"
    t.string   "returns_accepted_option"
    t.string   "returns_within_option"
    t.string   "shipping_cost_paid_by"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "ebay_shipping_service_options", force: :cascade do |t|
    t.integer  "shipping_service_id"
    t.decimal  "shipping_service_cost", precision: 16, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "ebay_shipping_services", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string   "self_graded_name"
    t.integer  "numeric_grade"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "professionally_graded_name"
    t.string   "self_graded_synonyms"
    t.string   "professionally_graded_synonyms"
  end

  create_table "item_name_word_maps", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "name_word_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "item_name_word_maps", ["item_id"], name: "index_item_name_word_maps_on_item_id", using: :btree
  add_index "item_name_word_maps", ["name_word_id"], name: "index_item_name_word_maps_on_name_word_id", using: :btree

  create_table "item_word_name_maps", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "name_word_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "item_word_name_maps", ["item_id"], name: "index_item_word_name_maps_on_item_id", using: :btree
  add_index "item_word_name_maps", ["name_word_id"], name: "index_item_word_name_maps_on_name_word_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "year"
    t.integer  "manufacturer_id"
    t.integer  "team_id"
    t.integer  "product_id"
    t.integer  "views"
    t.integer  "quantity"
    t.integer  "price_cents"
    t.integer  "numeric_grade"
    t.string   "card_number"
    t.integer  "grade_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "name_words", force: :cascade do |t|
    t.string   "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.text     "notification_params"
    t.string   "status"
    t.datetime "purchased_at"
    t.integer  "item_id"
    t.integer  "quantity"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "synonyms"
  end

  create_table "shipping_service_options", force: :cascade do |t|
    t.integer  "shipping_service_id"
    t.decimal  "shipping_service_cost", precision: 16, scale: 2
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "synonyms"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "synonyms"
  end

end
