# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150212081021) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.string   "city"
    t.string   "country"
    t.text     "bio"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mbid"
    t.string   "photo"
  end

  create_table "artists_events", id: false, force: :cascade do |t|
    t.integer "artist_id"
    t.integer "event_id"
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.string   "venue_name"
    t.text     "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "headliner"
    t.text     "artist"
    t.string   "city"
    t.string   "country"
    t.string   "id_event"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.text     "image"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin",        default: false
  end

end
