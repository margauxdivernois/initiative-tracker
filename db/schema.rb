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

ActiveRecord::Schema[7.1].define(version: 2024_02_22_193831) do
  create_table "character_fights", force: :cascade do |t|
    t.integer "character_id", null: false
    t.integer "fight_id", null: false
    t.integer "pv"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "initiative"
    t.index ["character_id"], name: "index_character_fights_on_character_id"
    t.index ["fight_id"], name: "index_character_fights_on_fight_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.integer "pv"
    t.integer "ac"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "current_player_id"
    t.integer "turn_count", default: 0
    t.index ["current_player_id"], name: "index_fights_on_current_player_id"
  end

  add_foreign_key "character_fights", "characters"
  add_foreign_key "character_fights", "fights"
  add_foreign_key "fights", "character_fights", column: "current_player_id"
end
