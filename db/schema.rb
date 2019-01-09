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

ActiveRecord::Schema.define(version: 2019_01_08_141943) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "member_id"
    t.integer "course_id"
    t.integer "order_id"
    t.date "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_pic"
    t.string "phone"
    t.index ["email"], name: "index_coaches_on_email", unique: true
    t.index ["reset_password_token"], name: "index_coaches_on_reset_password_token", unique: true
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.text "text"
    t.string "url"
    t.integer "placement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age_from"
    t.integer "age_to"
    t.string "course_image"
  end

  create_table "course_days", force: :cascade do |t|
    t.date "day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_niveaus", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "course_places", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.integer "city_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price"
    t.integer "coach_id"
    t.integer "course_niveau_id"
    t.integer "course_place_id"
    t.integer "course_day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_category_id"
    t.date "date"
    t.time "time_from"
    t.time "time_to"
    t.string "course_image"
    t.date "day"
    t.integer "member_id"
    t.integer "status", default: 0
    t.integer "limit", default: 100
  end

  create_table "courses_members", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "member_id", null: false
    t.index ["course_id", "member_id"], name: "index_courses_members_on_course_id_and_member_id"
    t.index ["member_id", "course_id"], name: "index_courses_members_on_member_id_and_course_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "subject"
    t.text "content"
    t.integer "course_id"
    t.integer "member_id"
    t.integer "status", default: 0
    t.integer "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grandparents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "member_id"
    t.integer "child_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "participation_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "course_id"
    t.string "profile_pic"
    t.string "phone"
    t.integer "gdpr"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "navs", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.integer "page_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "course_id"
    t.integer "quantity"
    t.decimal "price", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_order_items_on_course_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.decimal "sub_total", precision: 15, scale: 2
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "kurv"
    t.integer "member_id"
    t.string "email"
    t.string "child_first_name"
    t.string "child_last_name"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participations", force: :cascade do |t|
    t.integer "member_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "child_id"
    t.integer "grandparent_id"
    t.integer "order_id"
  end

  create_table "sub_navs", force: :cascade do |t|
    t.string "title"
    t.integer "nav_id"
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.string "link"
  end

  add_foreign_key "order_items", "courses"
  add_foreign_key "order_items", "orders"
end
