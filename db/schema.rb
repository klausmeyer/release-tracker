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

ActiveRecord::Schema[7.2].define(version: 2024_02_14_201704) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "source", null: false
    t.string "slug", null: false
    t.string "name", null: false
    t.bigint "version_pattern_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source", "slug"], name: "index_projects_on_source_and_slug", unique: true
    t.index ["version_pattern_id"], name: "index_projects_on_version_pattern_id"
  end

  create_table "version_patterns", force: :cascade do |t|
    t.string "name", null: false
    t.string "examples", null: false
    t.string "regexp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_version_patterns_on_name", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.integer "major", null: false
    t.integer "minor", null: false
    t.integer "patch"
    t.integer "pre"
    t.string "git_tag", null: false
    t.string "git_sha", null: false
    t.datetime "released_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "major", "minor", "patch", "pre"], name: "idx_on_project_id_major_minor_patch_pre_94543b0152", unique: true
    t.index ["project_id"], name: "index_versions_on_project_id"
  end

  add_foreign_key "projects", "version_patterns"
  add_foreign_key "versions", "projects"
end
