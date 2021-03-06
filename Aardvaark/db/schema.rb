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

ActiveRecord::Schema.define(version: 20140509165604) do

  create_table "advk_mailers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "user_id"
  end

  create_table "events", force: true do |t|
    t.date     "date"
    t.text     "description",     limit: 255
    t.string   "type_of_event"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "event_time"
    t.string   "location"
    t.integer  "organization_id"
    t.integer  "user_id"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "representative_name"
    t.string   "password_digest"
    t.string   "password"
  end

  create_table "relationship_junctions", force: true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.integer  "role_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "password_digest"
    t.boolean  "organization",       default: false
    t.string   "gender"
    t.text     "skills"
    t.integer  "age"
    t.boolean  "vehicle"
    t.integer  "passenger_capacity"
  end

  create_table "vehicles", force: true do |t|
    t.integer  "user_id"
    t.integer  "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
