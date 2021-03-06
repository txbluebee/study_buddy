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

ActiveRecord::Schema.define(version: 20170518183855) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flashcards", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "tag_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.text "description"
    t.string "github"
    t.integer "language_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "language_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "language_id"
  end

  create_table "tips", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "language_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "login"
    t.string "password"
  end

end
