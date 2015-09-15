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

ActiveRecord::Schema.define(version: 20150915220613) do

  create_table "member_scripts", force: :cascade do |t|
    t.integer  "member_id",     limit: 4
    t.integer  "script_id",     limit: 4
    t.float    "participation", limit: 24
    t.float    "percentual",    limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "member_scripts", ["member_id"], name: "fk_rails_7a622e4a02", using: :btree
  add_index "member_scripts", ["script_id"], name: "fk_rails_72b8d352be", using: :btree

  create_table "members", force: :cascade do |t|
    t.datetime "birthday"
    t.string   "member_name",      limit: 255
    t.string   "member_last_name", limit: 255
    t.string   "bank",             limit: 255
    t.string   "bank_ag",          limit: 255
    t.string   "bank_cc",          limit: 255
    t.boolean  "customer",         limit: 1
    t.boolean  "contributor",      limit: 1
    t.string   "cpf",              limit: 255, default: ""
    t.string   "cnpj",             limit: 255, default: ""
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "scipts", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.text     "definition",       limit: 65535
    t.text     "long_text",        limit: 65535
    t.string   "plataform",        limit: 255
    t.string   "industry",         limit: 255
    t.integer  "solution_type_id", limit: 4
    t.string   "script_file",      limit: 255
    t.string   "pdf_file",         limit: 255
    t.string   "complexity",       limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "scripts", force: :cascade do |t|
    t.string   "description",      limit: 255
    t.text     "definition",       limit: 65535
    t.text     "long_text",        limit: 65535
    t.string   "platform",         limit: 255
    t.string   "industry",         limit: 255
    t.integer  "solution_type_id", limit: 4
    t.string   "script_file",      limit: 255
    t.string   "pdf_file",         limit: 255
    t.string   "complexity",       limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "name",                   limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.integer  "role",                   limit: 4
    t.string   "invitation_token",       limit: 255
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit",       limit: 4
    t.integer  "invited_by_id",          limit: 4
    t.string   "invited_by_type",        limit: 255
    t.integer  "invitations_count",      limit: 4,   default: 0
    t.datetime "effective_date"
    t.integer  "member_id",              limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["member_id"], name: "fk_rails_172a24c10d", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "member_scripts", "members"
  add_foreign_key "member_scripts", "scripts"
  add_foreign_key "users", "members"
end
