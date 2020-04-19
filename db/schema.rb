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

ActiveRecord::Schema.define(version: 2020_04_11_135024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comfy_cms_blocks", force: :cascade do |t|
    t.string "identifier", null: false
    t.text "content"
    t.string "blockable_type"
    t.bigint "blockable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blockable_id", "blockable_type"], name: "index_comfy_cms_blocks_on_blockable_id_and_blockable_type"
    t.index ["blockable_type", "blockable_id"], name: "index_comfy_cms_blocks_on_blockable_type_and_blockable_id"
    t.index ["identifier"], name: "index_comfy_cms_blocks_on_identifier"
  end

  create_table "comfy_cms_categories", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "label", null: false
    t.string "categorized_type", null: false
    t.index ["site_id", "categorized_type", "label"], name: "index_cms_categories_on_site_id_and_cat_type_and_label", unique: true
  end

  create_table "comfy_cms_categorizations", force: :cascade do |t|
    t.integer "category_id", null: false
    t.string "categorized_type", null: false
    t.integer "categorized_id", null: false
    t.index ["category_id", "categorized_type", "categorized_id"], name: "index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id", unique: true
  end

  create_table "comfy_cms_files", force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "block_id"
    t.string "label", null: false
    t.string "file_file_name", null: false
    t.string "file_content_type", null: false
    t.integer "file_file_size", null: false
    t.string "description", limit: 2048
    t.integer "position", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "block_id"], name: "index_comfy_cms_files_on_site_id_and_block_id"
    t.index ["site_id", "file_file_name"], name: "index_comfy_cms_files_on_site_id_and_file_file_name"
    t.index ["site_id", "label"], name: "index_comfy_cms_files_on_site_id_and_label"
    t.index ["site_id", "position"], name: "index_comfy_cms_files_on_site_id_and_position"
  end

  create_table "comfy_cms_layouts", force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "parent_id"
    t.string "app_layout"
    t.string "label", null: false
    t.string "identifier", null: false
    t.text "content"
    t.text "css"
    t.text "js"
    t.integer "position", default: 0, null: false
    t.boolean "is_shared", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id", "position"], name: "index_comfy_cms_layouts_on_parent_id_and_position"
    t.index ["site_id", "identifier"], name: "index_comfy_cms_layouts_on_site_id_and_identifier", unique: true
  end

  create_table "comfy_cms_pages", force: :cascade do |t|
    t.integer "site_id", null: false
    t.integer "layout_id"
    t.integer "parent_id"
    t.integer "target_page_id"
    t.string "label", null: false
    t.string "slug"
    t.string "full_path", null: false
    t.text "content_cache"
    t.integer "position", default: 0, null: false
    t.integer "children_count", default: 0, null: false
    t.boolean "is_published", default: true, null: false
    t.boolean "is_shared", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id", "position"], name: "index_comfy_cms_pages_on_parent_id_and_position"
    t.index ["site_id", "full_path"], name: "index_comfy_cms_pages_on_site_id_and_full_path"
  end

  create_table "comfy_cms_revisions", force: :cascade do |t|
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.text "data"
    t.datetime "created_at"
    t.index ["record_type", "record_id", "created_at"], name: "index_cms_revisions_on_rtype_and_rid_and_created_at"
  end

  create_table "comfy_cms_sites", force: :cascade do |t|
    t.string "label", null: false
    t.string "identifier", null: false
    t.string "hostname", null: false
    t.string "path"
    t.string "locale", default: "en", null: false
    t.boolean "is_mirrored", default: false, null: false
    t.index ["hostname"], name: "index_comfy_cms_sites_on_hostname"
    t.index ["is_mirrored"], name: "index_comfy_cms_sites_on_is_mirrored"
  end

  create_table "comfy_cms_snippets", force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "label", null: false
    t.string "identifier", null: false
    t.text "content"
    t.integer "position", default: 0, null: false
    t.boolean "is_shared", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "identifier"], name: "index_comfy_cms_snippets_on_site_id_and_identifier", unique: true
    t.index ["site_id", "position"], name: "index_comfy_cms_snippets_on_site_id_and_position"
  end

  create_table "comments", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "body"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "experts", force: :cascade do |t|
    t.string "first_name", limit: 30
    t.string "last_name", limit: 30
    t.string "email"
    t.integer "phone_number"
    t.text "contact_address"
    t.text "short_bio"
    t.text "certification", default: [], array: true
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "talent_type_id"
    t.string "suggested_skill", limit: 50
    t.index ["email"], name: "index_experts_on_email", unique: true
    t.index ["talent_type_id"], name: "index_experts_on_talent_type_id"
  end

  create_table "finalized_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_finalized_requests_on_request_id"
    t.index ["user_id"], name: "index_finalized_requests_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "phone_number"
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "talent_assignments", force: :cascade do |t|
    t.date "engaged_date"
    t.date "start_date"
    t.date "end_date"
    t.bigint "finalized_request_id"
    t.bigint "expert_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_id"], name: "index_talent_assignments_on_expert_id"
    t.index ["finalized_request_id"], name: "index_talent_assignments_on_finalized_request_id"
  end

  create_table "talent_requests", force: :cascade do |t|
    t.integer "unit_price"
    t.integer "expected_contract_duration"
    t.date "expected_start_date"
    t.integer "quantity", default: 1
    t.bigint "user_id"
    t.bigint "request_id"
    t.bigint "talent_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_talent_requests_on_request_id"
    t.index ["talent_type_id"], name: "index_talent_requests_on_talent_type_id"
    t.index ["user_id"], name: "index_talent_requests_on_user_id"
  end

  create_table "talent_types", force: :cascade do |t|
    t.string "expert_specialization", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expert_specialization"], name: "index_talent_types_on_expert_specialization", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "amount"
    t.bigint "user_id"
    t.bigint "finalized_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["finalized_request_id"], name: "index_transactions_on_finalized_request_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "customer_role", default: true
    t.boolean "guest"
    t.boolean "expert", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "experts", "talent_types"
  add_foreign_key "finalized_requests", "requests"
  add_foreign_key "finalized_requests", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "talent_assignments", "experts"
  add_foreign_key "talent_assignments", "finalized_requests"
  add_foreign_key "talent_requests", "requests"
  add_foreign_key "talent_requests", "talent_types"
  add_foreign_key "talent_requests", "users"
  add_foreign_key "transactions", "finalized_requests"
  add_foreign_key "transactions", "users"
end
