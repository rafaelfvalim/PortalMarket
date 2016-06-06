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

ActiveRecord::Schema.define(version: 20160602211147) do

  create_table "addresses", force: :cascade do |t|
    t.string   "zip_code",     limit: 255
    t.string   "patio_type",   limit: 255
    t.string   "patio",        limit: 255
    t.string   "street",       limit: 255
    t.string   "number",       limit: 255
    t.string   "neighborhood", limit: 255
    t.string   "city",         limit: 255
    t.string   "state",        limit: 255
    t.string   "complement",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "attachment_docs", force: :cascade do |t|
    t.integer  "script_id",  limit: 4
    t.string   "file_name",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "attachment_docs", ["script_id"], name: "fk_rails_76eb8ec028", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "code",        limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "member_id",    limit: 4
    t.integer  "script_id",    limit: 4
    t.integer  "price_id",     limit: 4
    t.integer  "workplace_id", limit: 4, null: false
    t.boolean  "full_sale",    limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "carts", ["member_id"], name: "fk_rails_13907fb032", using: :btree
  add_index "carts", ["price_id"], name: "fk_rails_5fc637dbef", using: :btree
  add_index "carts", ["script_id"], name: "fk_rails_2c575d99c1", using: :btree
  add_index "carts", ["workplace_id"], name: "fk_rails_4c065256ce", using: :btree

  create_table "checking_accounts", force: :cascade do |t|
    t.string   "description",        limit: 255
    t.datetime "payment_date_time"
    t.datetime "movement_date_time"
    t.string   "status",             limit: 255
    t.decimal  "value",                          precision: 10
    t.float    "interest",           limit: 24
    t.decimal  "commission",                     precision: 10
    t.integer  "currency_id",        limit: 4
    t.date     "currency_base_date"
    t.string   "code_type",          limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "invoice_id",         limit: 4
    t.integer  "script_id",          limit: 4
  end

  add_index "checking_accounts", ["currency_id"], name: "fk_rails_b7c2ffc1f2", using: :btree
  add_index "checking_accounts", ["invoice_id"], name: "fk_rails_8f01c3c48b", using: :btree
  add_index "checking_accounts", ["script_id"], name: "fk_rails_c8832132dc", using: :btree

  create_table "complexities", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "file_tags", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "folders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "function_data_types", force: :cascade do |t|
    t.string   "function_type",             limit: 255
    t.integer  "user_id",                   limit: 4
    t.integer  "script_id",                 limit: 4
    t.string   "description",               limit: 255
    t.integer  "number_of_registers_types", limit: 4
    t.integer  "number_of_data_types",      limit: 4
    t.string   "complexity",                limit: 255
    t.integer  "number_of_function_points", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "function_data_types", ["script_id"], name: "fk_rails_aae462e65e", using: :btree
  add_index "function_data_types", ["user_id"], name: "fk_rails_06efc31e37", using: :btree

  create_table "function_transaction_types", force: :cascade do |t|
    t.string   "function_type",              limit: 255
    t.integer  "user_id",                    limit: 4
    t.integer  "script_id",                  limit: 4
    t.string   "description",                limit: 255
    t.integer  "number_of_referenced_files", limit: 4
    t.integer  "number_of_data_types",       limit: 4
    t.string   "complexity",                 limit: 255
    t.integer  "number_of_function_points",  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "function_transaction_types", ["script_id"], name: "fk_rails_cbde0d620c", using: :btree
  add_index "function_transaction_types", ["user_id"], name: "fk_rails_d193f93b2a", using: :btree

  create_table "industries", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "invoice_statuses", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "script_id",         limit: 4
    t.decimal  "value",                           precision: 10
    t.integer  "invoice_status_id", limit: 4
    t.integer  "workplace_id",      limit: 4,                    null: false
    t.string   "script_file",       limit: 255
    t.text     "notes",             limit: 65535
    t.datetime "invoice_date"
    t.datetime "pay_date"
    t.datetime "ship_date"
    t.string   "shipped_to",        limit: 255
    t.string   "shipped_via",       limit: 255
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "pay_method_id",     limit: 4,                    null: false
  end

  add_index "invoices", ["invoice_status_id"], name: "fk_rails_9ac2ae7e8e", using: :btree
  add_index "invoices", ["pay_method_id"], name: "fk_rails_c68b5c4063", using: :btree
  add_index "invoices", ["script_id"], name: "fk_rails_6cb6b0f3a2", using: :btree
  add_index "invoices", ["user_id"], name: "fk_rails_3d1522a0d8", using: :btree
  add_index "invoices", ["workplace_id"], name: "fk_rails_6662a5dccf", using: :btree

  create_table "licenses", force: :cascade do |t|
    t.integer  "invoice_id",      limit: 4
    t.string   "description",     limit: 255
    t.string   "license_key",     limit: 255
    t.datetime "expiration_date"
    t.text     "obs",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "licenses", ["invoice_id"], name: "fk_rails_f15eaa4d76", using: :btree

  create_table "member_scripts", force: :cascade do |t|
    t.integer  "member_id",     limit: 4
    t.integer  "script_id",     limit: 4
    t.float    "participation", limit: 24
    t.decimal  "percentual",               precision: 5, scale: 1
    t.boolean  "partner",       limit: 1
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "member_scripts", ["member_id"], name: "fk_rails_7a622e4a02", using: :btree
  add_index "member_scripts", ["script_id"], name: "fk_rails_72b8d352be", using: :btree

  create_table "member_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "master_user_id",   limit: 4
    t.integer  "member_type_id",   limit: 4,                null: false
    t.datetime "birthday"
    t.string   "member_name",      limit: 255
    t.string   "member_last_name", limit: 255
    t.string   "phone_number",     limit: 255
    t.string   "cellphone_number", limit: 255
    t.integer  "bank_id",          limit: 4
    t.string   "bank_ag",          limit: 255
    t.string   "bank_cc",          limit: 255
    t.string   "bank_cc_digit",    limit: 255
    t.string   "cpf",              limit: 255, default: ""
    t.string   "cnpj",             limit: 255, default: ""
    t.string   "company_name",     limit: 255
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "members", ["bank_id"], name: "fk_rails_d363d09855", using: :btree
  add_index "members", ["master_user_id"], name: "fk_rails_dfbee4202f", using: :btree
  add_index "members", ["member_type_id"], name: "fk_rails_9a10de6ee1", using: :btree
  add_index "members", ["user_id"], name: "fk_rails_2e88fb7ce9", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "message_to", limit: 4,     null: false
    t.integer  "user_id",    limit: 4,     null: false
  end

  add_index "messages", ["message_to"], name: "fk_rails_00179f15ce", using: :btree
  add_index "messages", ["user_id"], name: "fk_rails_273a25a7a6", using: :btree

  create_table "pay_methods", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "notes",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "prices", force: :cascade do |t|
    t.integer  "script_id",            limit: 4
    t.decimal  "value",                           precision: 10
    t.integer  "currency_id",          limit: 4
    t.date     "currency_data"
    t.float    "aggregate_percentage", limit: 24
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "prices", ["currency_id"], name: "fk_rails_79acddd52f", using: :btree
  add_index "prices", ["script_id"], name: "fk_rails_fa61386042", using: :btree

  create_table "process_modules", force: :cascade do |t|
    t.string   "description",                limit: 255
    t.integer  "referrer_process_module_id", limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "image",                      limit: 255
    t.string   "long_description",           limit: 255
  end

  add_index "process_modules", ["referrer_process_module_id"], name: "fk_rails_77f666f400", using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "file_name",   limit: 255
    t.string   "file_type",   limit: 255
    t.integer  "user_id",     limit: 4
    t.integer  "folder_id",   limit: 4
    t.integer  "file_tag_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "view_group",  limit: 255
  end

  add_index "publications", ["file_tag_id"], name: "fk_rails_781b7a040a", using: :btree
  add_index "publications", ["folder_id"], name: "fk_rails_5d410aacbf", using: :btree
  add_index "publications", ["user_id"], name: "fk_rails_5b8fd83dce", using: :btree

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

  create_table "reservations", force: :cascade do |t|
    t.integer  "script_id",       limit: 4
    t.integer  "owner_user_id",   limit: 4
    t.integer  "reserve_for",     limit: 4
    t.datetime "expiration_time"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "reservations", ["owner_user_id"], name: "fk_rails_7baa41912e", using: :btree
  add_index "reservations", ["reserve_for"], name: "fk_rails_77c12ec4f5", using: :btree
  add_index "reservations", ["script_id"], name: "fk_rails_a99ec70b48", using: :btree

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
    t.boolean  "has_price",        limit: 1
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "status_id",        limit: 4
  end

  add_index "scripts", ["solution_type_id"], name: "fk_rails_7ad93069c3", using: :btree
  add_index "scripts", ["status_id"], name: "fk_rails_4a68ce8b17", using: :btree

  create_table "searchjoy_searches", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "search_type",      limit: 255
    t.string   "query",            limit: 255
    t.string   "normalized_query", limit: 255
    t.integer  "results_count",    limit: 4
    t.datetime "created_at"
    t.integer  "convertable_id",   limit: 4
    t.string   "convertable_type", limit: 255
    t.datetime "converted_at"
  end

  add_index "searchjoy_searches", ["convertable_id", "convertable_type"], name: "index_searchjoy_searches_on_convertable_id_and_convertable_type", using: :btree
  add_index "searchjoy_searches", ["created_at"], name: "index_searchjoy_searches_on_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "created_at"], name: "index_searchjoy_searches_on_search_type_and_created_at", using: :btree
  add_index "searchjoy_searches", ["search_type", "normalized_query", "created_at"], name: "index_searchjoy_searches_on_search_type_and_normalized_query_an", using: :btree
  add_index "searchjoy_searches", ["user_id"], name: "fk_rails_13bf622557", using: :btree

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

  create_table "systems", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",        null: false
    t.integer  "address_id",             limit: 4
    t.string   "status",                 limit: 255, default: "inativo"
    t.string   "encrypted_password",     limit: 255, default: "",        null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
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
    t.string   "key_phrase",             limit: 255
    t.string   "timezone",               limit: 255
    t.string   "avatar",                 limit: 255
  end

  add_index "users", ["address_id"], name: "fk_rails_eb2fc738e4", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "value_chains", force: :cascade do |t|
    t.integer  "process_module_id", limit: 4
    t.integer  "script_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "value_chains", ["process_module_id"], name: "index_value_chains_on_process_module_id", using: :btree
  add_index "value_chains", ["script_id"], name: "index_value_chains_on_script_id", using: :btree

  create_table "view_publications", force: :cascade do |t|
    t.integer  "publication_id", limit: 4
    t.boolean  "visited",        limit: 1
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "view_publications", ["publication_id"], name: "fk_rails_82ce7d7e68", using: :btree
  add_index "view_publications", ["user_id"], name: "fk_rails_7456f81929", using: :btree

  create_table "workplaces", force: :cascade do |t|
    t.integer  "member_id",         limit: 4,   null: false
    t.string   "organization_name", limit: 255
    t.integer  "system_id",         limit: 4
    t.string   "system_number",     limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "workplaces", ["member_id"], name: "fk_rails_39fe69f690", using: :btree
  add_index "workplaces", ["system_id"], name: "fk_rails_7f06ffdf18", using: :btree

  add_foreign_key "attachment_docs", "scripts"
  add_foreign_key "carts", "members"
  add_foreign_key "carts", "prices"
  add_foreign_key "carts", "scripts"
  add_foreign_key "carts", "workplaces"
  add_foreign_key "checking_accounts", "currencies"
  add_foreign_key "checking_accounts", "invoices"
  add_foreign_key "checking_accounts", "scripts"
  add_foreign_key "function_data_types", "scripts"
  add_foreign_key "function_data_types", "users"
  add_foreign_key "function_transaction_types", "scripts"
  add_foreign_key "function_transaction_types", "users"
  add_foreign_key "invoices", "invoice_statuses"
  add_foreign_key "invoices", "pay_methods"
  add_foreign_key "invoices", "scripts"
  add_foreign_key "invoices", "users"
  add_foreign_key "invoices", "workplaces"
  add_foreign_key "licenses", "invoices"
  add_foreign_key "member_scripts", "members"
  add_foreign_key "member_scripts", "scripts"
  add_foreign_key "members", "banks"
  add_foreign_key "members", "member_types"
  add_foreign_key "members", "users"
  add_foreign_key "members", "users", column: "master_user_id"
  add_foreign_key "messages", "users"
  add_foreign_key "messages", "users", column: "message_to"
  add_foreign_key "prices", "currencies"
  add_foreign_key "prices", "scripts"
  add_foreign_key "process_modules", "process_modules", column: "referrer_process_module_id", on_update: :nullify, on_delete: :nullify
  add_foreign_key "publications", "file_tags"
  add_foreign_key "publications", "folders"
  add_foreign_key "publications", "users"
  add_foreign_key "related_scripts", "scripts", column: "related_script_id", on_update: :nullify, on_delete: :nullify
  add_foreign_key "related_scripts", "scripts", on_update: :nullify, on_delete: :nullify
  add_foreign_key "requirements", "scripts"
  add_foreign_key "requirements", "scripts", column: "script_id_requirement"
  add_foreign_key "reservations", "scripts"
  add_foreign_key "reservations", "users", column: "owner_user_id"
  add_foreign_key "reservations", "users", column: "reserve_for"
  add_foreign_key "scripts", "solution_types"
  add_foreign_key "scripts", "statuses", on_update: :nullify, on_delete: :nullify
  add_foreign_key "searchjoy_searches", "users"
  add_foreign_key "users", "addresses"
  add_foreign_key "value_chains", "process_modules"
  add_foreign_key "value_chains", "scripts"
  add_foreign_key "view_publications", "publications"
  add_foreign_key "view_publications", "users"
  add_foreign_key "workplaces", "members"
  add_foreign_key "workplaces", "systems"
end
