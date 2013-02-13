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

ActiveRecord::Schema.define(:version => 20130211230723) do

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "uploads", :force => true do |t|
    t.string  "name"
    t.text    "description"
    t.string  "uploadGroup"
    t.integer "ownerId"
    t.string  "content_file_name"
    t.string  "content_content_type"
    t.integer "content_file_size"
    t.integer "content_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "familyName"
    t.integer  "age"
    t.string   "userType"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.integer  "avatar_updated_at"
    t.string   "email"
  end

end
