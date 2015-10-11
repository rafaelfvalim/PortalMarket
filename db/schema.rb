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

ActiveRecord::Schema.define(version: 20151011001527) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "member_id",  limit: 4
    t.integer  "script_id",  limit: 4
    t.integer  "price_id",   limit: 4
    t.boolean  "full_sale",  limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "carts", ["member_id"], name: "fk_rails_13907fb032", using: :btree
  add_index "carts", ["price_id"], name: "fk_rails_5fc637dbef", using: :btree
  add_index "carts", ["script_id"], name: "fk_rails_2c575d99c1", using: :btree

  create_table "checking_accounts", force: :cascade do |t|
    t.string   "description",        limit: 255
    t.datetime "payment_date_time"
    t.datetime "movement_date_time"
    t.string   "status",             limit: 255
    t.decimal  "value",                          precision: 10
    t.float    "interest",           limit: 24
    t.integer  "member_id",          limit: 4
    t.decimal  "commission",                     precision: 10
    t.integer  "currency_id",        limit: 4
    t.date     "currency_base_date"
    t.integer  "script_id",          limit: 4
    t.string   "code_type",          limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "checking_accounts", ["currency_id"], name: "fk_rails_b7c2ffc1f2", using: :btree
  add_index "checking_accounts", ["member_id"], name: "fk_rails_b10d6a3121", using: :btree
  add_index "checking_accounts", ["script_id"], name: "fk_rails_c8832132dc", using: :btree

  create_table "currencies", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

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

  create_table "prices", force: :cascade do |t|
    t.integer  "script_id",     limit: 4
    t.decimal  "value",                   precision: 10
    t.integer  "currency_id",   limit: 4
    t.date     "currency_data"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "prices", ["currency_id"], name: "fk_rails_79acddd52f", using: :btree
  add_index "prices", ["script_id"], name: "fk_rails_fa61386042", using: :btree

  create_table "process_modules", force: :cascade do |t|
    t.string   "description",                limit: 255
    t.integer  "referrer_process_module_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "process_modules", ["referrer_process_module_id"], name: "fk_rails_77f666f400", using: :btree

  create_table "related_scripts", force: :cascade do |t|
    t.integer "script_id",         limit: 4
    t.integer "related_script_id", limit: 4
  end

  add_index "related_scripts", ["related_script_id"], name: "fk_rails_450bed89bb", using: :btree
  add_index "related_scripts", ["script_id"], name: "fk_rails_38571543db", using: :btree

  create_table "requirements", force: :cascade do |t|
    t.integer "script_id",             limit: 4
    t.string  "requirement",           limit: 255
    t.integer "script_id_requirement", limit: 4
  end

  add_index "requirements", ["script_id"], name: "fk_rails_ef7ba3079c", using: :btree
  add_index "requirements", ["script_id_requirement"], name: "fk_rails_0be59936c9", using: :btree

  create_table "scripts", force: :cascade do |t|
    t.string   "name",             limit: 255
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
    t.integer  "status_id",        limit: 4
  end

  add_index "scripts", ["solution_type_id"], name: "fk_rails_7ad93069c3", using: :btree
  add_index "scripts", ["status_id"], name: "fk_rails_4a68ce8b17", using: :btree

  create_table "solution_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "table_statuses", force: :cascade do |t|
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
    t.boolean  "complete",               limit: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["member_id"], name: "fk_rails_172a24c10d", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "value_chains", force: :cascade do |t|
    t.integer  "process_module_id", limit: 4
    t.integer  "script_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "value_chains", ["process_module_id"], name: "index_value_chains_on_process_module_id", using: :btree
  add_index "value_chains", ["script_id"], name: "index_value_chains_on_script_id", using: :btree

  add_foreign_key "carts", "members"
  add_foreign_key "carts", "prices"
  add_foreign_key "carts", "scripts"
  add_foreign_key "checking_accounts", "currencies"
  add_foreign_key "checking_accounts", "members"
  add_foreign_key "checking_accounts", "scripts"
  add_foreign_key "member_scripts", "members"
  add_foreign_key "member_scripts", "scripts"
  add_foreign_key "prices", "currencies"
  add_foreign_key "prices", "scripts"
  add_foreign_key "process_modules", "process_modules", column: "referrer_process_module_id", on_update: :nullify, on_delete: :nullify
  add_foreign_key "related_scripts", "scripts", column: "related_script_id", on_update: :nullify, on_delete: :nullify
  add_foreign_key "related_scripts", "scripts", on_update: :nullify, on_delete: :nullify
  add_foreign_key "requirements", "scripts"
  add_foreign_key "requirements", "scripts", column: "script_id_requirement"
  add_foreign_key "scripts", "solution_types"
  add_foreign_key "scripts", "statuses", on_update: :nullify, on_delete: :nullify
  add_foreign_key "users", "members"
  add_foreign_key "value_chains", "process_modules"
  add_foreign_key "value_chains", "scripts"
end
