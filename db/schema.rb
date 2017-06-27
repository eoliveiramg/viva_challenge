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

ActiveRecord::Schema.define(version: 20170626230117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.bigint "property_id"
    t.bigint "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_locations_on_property_id"
    t.index ["province_id"], name: "index_locations_on_province_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.integer "lat"
    t.integer "long"
    t.integer "beds"
    t.integer "baths"
    t.integer "square_meters"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string "name"
    t.integer "upper_left_x"
    t.integer "upper_left_y"
    t.integer "bottom_right_x"
    t.integer "bottom_right_y"
  end

  add_foreign_key "locations", "properties"
  add_foreign_key "locations", "provinces"
end
