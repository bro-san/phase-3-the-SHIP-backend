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

ActiveRecord::Schema.define(version: 2022_07_12_212922) do

  create_table "character1s", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "description"
    t.string "imageURL"
    t.string "anime_name"
    t.string "anime_imageURL"
  end

  create_table "character2s", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "description"
    t.string "imageURL"
    t.string "anime_name"
    t.string "anime_imageURL"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.integer "ship_id"
  end

  create_table "ships", force: :cascade do |t|
    t.string "name"
    t.integer "character1_id"
    t.integer "character2_id"
  end

end
