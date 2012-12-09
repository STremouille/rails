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

ActiveRecord::Schema.define(:version => 20121123090729) do

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.string   "body"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "duration"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_types", ["user_id"], :name => "index_user_types_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "familyName"
    t.string   "age"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
