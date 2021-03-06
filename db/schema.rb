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

ActiveRecord::Schema.define(version: 20151209043601) do

  create_table "books", force: :cascade do |t|
    t.string   "google_id"
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.string   "cover"
    t.integer  "pages"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bookshelves", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "bookshelves", ["user_id"], name: "index_bookshelves_on_user_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "posts", ["book_id"], name: "index_posts_on_book_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "shelfitems", force: :cascade do |t|
    t.integer "book_id"
    t.integer "bookshelf_id"
    t.integer "page",         default: 0
    t.boolean "finished",     default: false
  end

  add_index "shelfitems", ["book_id"], name: "index_shelfitems_on_book_id"
  add_index "shelfitems", ["bookshelf_id"], name: "index_shelfitems_on_bookshelf_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
