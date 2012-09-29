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

ActiveRecord::Schema.define(:version => 20120929222824) do

  create_table "blackmails", :force => true do |t|
    t.integer  "hustler"
    t.integer  "victim_id"
    t.text     "note"
    t.datetime "deadline"
    t.string   "video_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.decimal  "amount"
    t.integer  "status_cd"
  end

  add_index "blackmails", ["hustler"], :name => "index_blackmails_on_sender_id"
  add_index "blackmails", ["victim_id"], :name => "index_blackmails_on_recipient_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "facebook_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
