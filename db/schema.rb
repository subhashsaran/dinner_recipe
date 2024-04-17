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

ActiveRecord::Schema[7.0].define(version: 2024_04_14_110957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "ingredient_recipes", force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_ingredient_recipes_on_ingredient_id"
    t.index ["recipe_id"], name: "index_ingredient_recipes_on_recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
    t.index ["name"], name: "trgm_index_on_ingredients_name", opclass: :gin_trgm_ops, using: :gin
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title", null: false
    t.integer "cook_time", null: false
    t.integer "prep_time", null: false
    t.float "ratings"
    t.string "image_url", null: false
    t.string "category"
    t.string "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredient_recipes", "ingredients"
  add_foreign_key "ingredient_recipes", "recipes"
end
