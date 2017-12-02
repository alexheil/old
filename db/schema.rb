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

ActiveRecord::Schema.define(version: 20171129014056) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "slug",                   default: "", null: false
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
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["name"], name: "index_admins_on_name", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["slug"], name: "index_admins_on_slug", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.string   "image"
    t.string   "anchor",     default: ""
    t.string   "link",       default: ""
    t.string   "slug"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["slug"], name: "index_categories_on_slug"
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "admin_id"
    t.string   "title"
    t.string   "tagline"
    t.string   "image"
    t.string   "image_source",      default: ""
    t.string   "image_source_link", default: ""
    t.string   "anchor",            default: ""
    t.string   "link",              default: ""
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["admin_id"], name: "index_groups_on_admin_id"
    t.index ["category_id"], name: "index_groups_on_category_id"
    t.index ["slug"], name: "index_groups_on_slug"
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "number"
    t.string   "title"
    t.string   "image"
    t.string   "image_source",      default: ""
    t.string   "image_source_link", default: ""
    t.string   "anchor",            default: ""
    t.string   "link",              default: ""
    t.string   "embed",             default: ""
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["group_id"], name: "index_posts_on_group_id"
    t.index ["slug"], name: "index_posts_on_slug"
  end

end
