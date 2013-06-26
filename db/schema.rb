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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130626004521) do

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "functions", ["slug"], :name => "index_functions_on_slug", :unique => true

  create_table "object_resources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "tombamento"
    t.integer  "sector_id"
    t.integer  "place_id"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "object_resources", ["slug"], :name => "index_object_resources_on_slug", :unique => true

  create_table "object_resources_reservations", :id => false, :force => true do |t|
    t.integer "object_resource_id"
    t.integer "reservation_id"
  end

  add_index "object_resources_reservations", ["object_resource_id", "reservation_id"], :name => "index1"
  add_index "object_resources_reservations", ["reservation_id"], :name => "index2"

  create_table "places", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "code"
    t.integer  "capacity"
    t.integer  "width"
    t.integer  "length"
    t.integer  "room_type_id"
    t.integer  "sector_id"
    t.string   "slug"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "places", ["slug"], :name => "index_places_on_slug", :unique => true

  create_table "places_services", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "service_id"
  end

  add_index "places_services", ["place_id", "service_id"], :name => "index_places_services_on_place_id_and_service_id"
  add_index "places_services", ["service_id"], :name => "index_places_services_on_service_id"

  create_table "reservations", :force => true do |t|
    t.datetime "begin"
    t.datetime "end"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "room_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "room_types", ["slug"], :name => "index_room_types_on_slug", :unique => true

  create_table "sectors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sectors", ["slug"], :name => "index_sectors_on_slug", :unique => true

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "services", ["slug"], :name => "index_services_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "cpf",                    :default => "", :null => false
    t.string   "name"
    t.integer  "function_id"
    t.integer  "sector_id"
    t.string   "slug"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["cpf"], :name => "index_users_on_cpf", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
