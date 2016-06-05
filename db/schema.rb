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

ActiveRecord::Schema.define(version: 20160605101323) do

  create_table "car_bookings", force: :cascade do |t|
    t.integer  "car_id",          limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",          limit: 255
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "start_latitude",              precision: 10, scale: 7
    t.decimal  "start_longitude",             precision: 10, scale: 7
    t.decimal  "end_latitude",                precision: 10, scale: 7
    t.decimal  "end_longitude",               precision: 10, scale: 7
    t.decimal  "distance",                    precision: 10, scale: 7, default: 0.0
    t.decimal  "amount",                      precision: 10, scale: 2
  end

  add_index "car_bookings", ["car_id"], name: "index_car_bookings_on_car_id", using: :btree
  add_index "car_bookings", ["user_id"], name: "index_car_bookings_on_user_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "number",     limit: 255
    t.string   "make",       limit: 255
    t.string   "device_id",  limit: 255
    t.decimal  "latitude",               precision: 10, scale: 7
    t.decimal  "longitude",              precision: 10, scale: 7
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.boolean  "available",                                       default: true
  end

  create_table "licenses", force: :cascade do |t|
    t.string   "filename",      limit: 255
    t.string   "content_type",  limit: 255
    t.binary   "file_contents", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "licenses_users", id: false, force: :cascade do |t|
    t.integer "license_id", limit: 4
    t.integer "user_id",    limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "full_name",  limit: 255
    t.integer  "age",        limit: 4
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "sex",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "car_bookings", "cars", on_delete: :cascade
  add_foreign_key "car_bookings", "users", on_delete: :cascade
end
