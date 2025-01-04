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

ActiveRecord::Schema[7.1].define(version: 2025_01_04_154751) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "date_summaries", force: :cascade do |t|
    t.date "date", null: false
    t.decimal "complete_rate", precision: 5, scale: 2, default: "0.0"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "date_summary_id", null: false
    t.time "time", null: false
    t.string "goal"
    t.integer "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date_summary_id"], name: "index_schedules_on_date_summary_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "time_interval", default: 60, null: false
    t.time "start_time", default: "2000-01-01 10:00:00", null: false
    t.time "end_time", default: "2000-01-01 18:00:00", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "schedules", "date_summaries"
end
