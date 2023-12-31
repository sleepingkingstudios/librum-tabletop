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

ActiveRecord::Schema[7.0].define(version: 2023_07_13_095426) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "generic_references", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.boolean "stub", default: false, null: false
    t.jsonb "source_metadata", default: {}, null: false
    t.text "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "source_id"
    t.index ["slug"], name: "index_generic_references_on_slug"
    t.index ["source_id", "slug"], name: "index_generic_references_on_source_id_and_slug", unique: true
    t.index ["source_id"], name: "index_generic_references_on_source_id"
  end

  create_table "librum_tabletop_game_settings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "publisher_id"
    t.index ["name"], name: "index_librum_tabletop_game_settings_on_name", unique: true
    t.index ["publisher_id"], name: "index_librum_tabletop_game_settings_on_publisher_id"
    t.index ["slug"], name: "index_librum_tabletop_game_settings_on_slug", unique: true
  end

  create_table "librum_tabletop_game_systems", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.string "edition", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "publisher_id"
    t.index ["name", "edition"], name: "index_librum_tabletop_game_systems_on_name_and_edition", unique: true
    t.index ["publisher_id"], name: "index_librum_tabletop_game_systems_on_publisher_id"
    t.index ["slug"], name: "index_librum_tabletop_game_systems_on_slug", unique: true
  end

  create_table "librum_tabletop_publishers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.string "website", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_librum_tabletop_publishers_on_name", unique: true
    t.index ["slug"], name: "index_librum_tabletop_publishers_on_slug", unique: true
  end

  create_table "librum_tabletop_sources", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type", null: false
    t.jsonb "data", default: {}, null: false
    t.string "name", default: "", null: false
    t.string "slug", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "game_setting_id"
    t.uuid "game_system_id"
    t.uuid "publisher_id"
    t.uuid "user_id"
    t.index ["game_setting_id"], name: "index_librum_tabletop_sources_on_game_setting_id"
    t.index ["game_system_id"], name: "index_librum_tabletop_sources_on_game_system_id"
    t.index ["name", "game_system_id", "publisher_id"], name: "index_tabletop_sources_on_name_and_system_and_publisher_ids", unique: true
    t.index ["publisher_id"], name: "index_librum_tabletop_sources_on_publisher_id"
    t.index ["slug", "game_system_id"], name: "index_tabletop_sources_on_slug_and_game_system_id", unique: true
    t.index ["user_id"], name: "index_librum_tabletop_sources_on_user_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
