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

ActiveRecord::Schema.define(version: 2020_04_27_180406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "phone_number"
    t.text "contact_address"
    t.text "short_bio"
    t.text "certification", default: [], array: true
    t.boolean "status", default: false
    t.string "suggested_skill", limit: 50
    t.bigint "talent_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.text "contents"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "contract_cost"
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
    t.text "description"
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
    t.boolean "guest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "superadmin_role", default: false
    t.boolean "admin_role", default: false
    t.boolean "customer_role", default: true
    t.boolean "expert", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "posts"
  add_foreign_key "experts", "talent_types"
  add_foreign_key "finalized_requests", "requests"
  add_foreign_key "finalized_requests", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "requests", "users"
  add_foreign_key "talent_assignments", "experts"
  add_foreign_key "talent_assignments", "finalized_requests"
  add_foreign_key "talent_requests", "requests"
  add_foreign_key "talent_requests", "talent_types"
  add_foreign_key "talent_requests", "users"
  add_foreign_key "transactions", "finalized_requests"
  add_foreign_key "transactions", "users"
end
