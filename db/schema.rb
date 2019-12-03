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

ActiveRecord::Schema.define(version: 2019_12_03_092230) do

  create_table "articles", force: :cascade do |t|
    t.integer "feed_id"
    t.string "title"
    t.string "link"
    t.text "description"
    t.datetime "published_date"
    t.string "image_link"
    t.string "audio_link"
    t.string "audio_type"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.integer "user_id"
    t.string "image_link"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

end
