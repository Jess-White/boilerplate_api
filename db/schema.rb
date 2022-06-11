# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_10_202949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "boilerplates", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "category_id"
    t.string "title"
    t.text "text"
    t.integer "wordcount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "organization_uuid"
    t.uuid "category_uuid"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "organization_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "organization_uuid"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "email"
    t.string "organization_name"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "funding_orgs", force: :cascade do |t|
    t.string "website"
    t.string "name"
    t.integer "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "organization_uuid"
  end

  create_table "grants", force: :cascade do |t|
    t.integer "organization_id"
    t.string "title"
    t.integer "funding_org_id"
    t.string "rfp_url"
    t.datetime "deadline"
    t.boolean "submitted"
    t.boolean "successful"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "purpose"
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "organization_uuid"
    t.uuid "funding_org_uuid"
  end

  create_table "organization_users", force: :cascade do |t|
    t.integer "organization_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "organization_uuid"
    t.uuid "user_uuid"
    t.index ["organization_id", "user_id"], name: "index_organization_users_on_organization_id_and_user_id", unique: true
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
  end

  create_table "report_sections", force: :cascade do |t|
    t.integer "report_id"
    t.string "title"
    t.text "text"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wordcount"
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "report_uuid"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "grant_id"
    t.string "title"
    t.datetime "deadline"
    t.boolean "submitted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "grant_uuid"
  end

  create_table "reviewers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "grant_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "grant_id"
    t.string "title"
    t.text "text"
    t.integer "sort_order"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wordcount"
    t.boolean "archived", default: false
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.uuid "grant_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.boolean "active"
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
  end

end
