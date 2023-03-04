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

ActiveRecord::Schema[7.0].define(version: 2023_02_28_021307) do
  create_table "playerperformances", force: :cascade do |t|
    t.text "matches_played"
    t.text "runs"
    t.text "fifties"
    t.text "average"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_playerperformances_on_team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.string "batting_style"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token"
    t.string "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teamperformances", force: :cascade do |t|
    t.text "matches_played"
    t.text "won"
    t.text "loss"
    t.text "points"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_teamperformances_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "captain_name"
    t.string "jersey_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tournaaments", force: :cascade do |t|
    t.text "no_of_matches"
    t.text "match_no"
    t.text "start_date"
    t.text "end_date"
    t.text "toss"
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "match_date"
    t.text "matches_played"
    t.index ["team_id"], name: "index_tournaaments_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "email"
    t.text "password"
    t.text "token"
    t.datetime "expire_at"
    t.boolean "logged_in", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "playerperformances", "teams"
  add_foreign_key "players", "teams"
  add_foreign_key "teamperformances", "teams"
  add_foreign_key "tournaaments", "teams"
end
