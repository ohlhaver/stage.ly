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

ActiveRecord::Schema.define(:version => 20130206181049) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "affinities", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "title"
  end

  add_index "affinities", ["artist_id"], :name => "index_affinities_on_artist_id"
  add_index "affinities", ["category_id"], :name => "index_affinities_on_category_id"

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "type_id"
  end

  add_index "categories", ["type_id"], :name => "index_categories_on_type_id"

  create_table "compositions", :force => true do |t|
    t.integer  "work_id"
    t.integer  "artist_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "compositions", ["artist_id", "work_id"], :name => "index_compositions_on_artist_id_and_work_id"
  add_index "compositions", ["artist_id"], :name => "index_compositions_on_artist_id"
  add_index "compositions", ["work_id"], :name => "index_compositions_on_work_id"

  create_table "event_categories", :force => true do |t|
    t.integer  "event_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "event_categories", ["category_id", "event_id"], :name => "index_event_categories_on_category_id_and_event_id"
  add_index "event_categories", ["category_id"], :name => "index_event_categories_on_category_id"
  add_index "event_categories", ["event_id"], :name => "index_event_categories_on_event_id"

  create_table "event_composers", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "event_composers", ["artist_id", "event_id"], :name => "index_event_composers_on_artist_id_and_event_id"
  add_index "event_composers", ["artist_id"], :name => "index_event_composers_on_artist_id"
  add_index "event_composers", ["event_id"], :name => "index_event_composers_on_event_id"

  create_table "event_subcategories", :force => true do |t|
    t.integer  "event_id"
    t.integer  "subcategory_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "event_subcategories", ["event_id"], :name => "index_event_subcategories_on_event_id"
  add_index "event_subcategories", ["subcategory_id"], :name => "index_event_subcategories_on_subcategory_id"

  create_table "events", :force => true do |t|
    t.integer  "venue_id"
    t.string   "price"
    t.string   "url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.datetime "time"
    t.string   "title"
    t.integer  "type_id"
    t.string   "worktitle"
    t.string   "artisttitle"
    t.string   "composertitle"
    t.boolean  "soldout"
    t.boolean  "cancelled"
  end

  add_index "events", ["type_id"], :name => "index_events_on_type_id"
  add_index "events", ["venue_id"], :name => "index_events_on_venue_id"

  create_table "occasions", :force => true do |t|
    t.integer  "work_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "occasions", ["event_id"], :name => "index_occasions_on_event_id"
  add_index "occasions", ["work_id"], :name => "index_occasions_on_work_id"

  create_table "performances", :force => true do |t|
    t.integer  "artist_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
  end

  add_index "performances", ["artist_id"], :name => "index_performances_on_artist_id"
  add_index "performances", ["event_id"], :name => "index_performances_on_event_id"

  create_table "subcategories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "subcategories", ["category_id"], :name => "index_subcategories_on_category_id"

  create_table "types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "singular"
    t.integer  "gid"
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "work_categories", :force => true do |t|
    t.integer  "work_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "work_categories", ["category_id", "work_id"], :name => "index_work_categories_on_category_id_and_work_id"
  add_index "work_categories", ["category_id"], :name => "index_work_categories_on_category_id"
  add_index "work_categories", ["work_id"], :name => "index_work_categories_on_work_id"

  create_table "works", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "category_id"
    t.integer  "subcategory_id"
  end

end
