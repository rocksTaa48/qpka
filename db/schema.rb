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

ActiveRecord::Schema[7.0].define(version: 2023_12_06_131612) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: ""
    t.decimal "price", precision: 8, scale: 3, null: false
    t.integer "quantity", default: 1, null: false
    t.string "aasm_state", default: "", null: false
    t.string "value", default: "", null: false
    t.bigint "subcategory_id", null: false
    t.integer "auc_length", default: 7, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subcategory_id"], name: "index_items_on_subcategory_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "description", default: ""
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  add_foreign_key "items", "subcategories"
  add_foreign_key "subcategories", "categories"
end
