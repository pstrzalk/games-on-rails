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

ActiveRecord::Schema[7.0].define(version: 2023_08_11_234700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tic_tac_toe_game", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "board", array: true
    t.string "turn_for"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tic_tac_toe_read_model_games", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "turn_for"
    t.string "winner"
    t.string "board00"
    t.string "board01"
    t.string "board02"
    t.string "board10"
    t.string "board11"
    t.string "board12"
    t.string "board20"
    t.string "board21"
    t.string "board22"
    t.datetime "started_at", precision: nil
    t.datetime "finished_at", precision: nil
  end

end
