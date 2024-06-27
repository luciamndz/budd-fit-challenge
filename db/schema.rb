# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_27_211122) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "challenge_infos", force: :cascade do |t|
    t.integer "user_score"
    t.boolean "attendance", default: false
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_status"
    t.index ["challenge_id"], name: "index_challenge_infos_on_challenge_id"
    t.index ["user_id"], name: "index_challenge_infos_on_user_id"
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "challenge_type"
    t.string "activity"
    t.string "status", default: "created"
    t.integer "global_score"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "start_date"
    t.string "end_date"
    t.index ["user_id"], name: "index_challenges_on_user_id"
  end

  create_table "exercise_comments", force: :cascade do |t|
    t.text "comments"
    t.bigint "exercise_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_session_id"], name: "index_exercise_comments_on_exercise_session_id"
  end

  create_table "exercise_sessions", force: :cascade do |t|
    t.string "activity"
    t.integer "time_length"
    t.string "evidence"
    t.text "description"
    t.integer "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "challenge_info_id", null: false
    t.index ["challenge_info_id"], name: "index_exercise_sessions_on_challenge_info_id"
  end

  create_table "frienships", force: :cascade do |t|
    t.string "status"
    t.bigint "asker_id"
    t.bigint "reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asker_id"], name: "index_frienships_on_asker_id"
    t.index ["reciever_id"], name: "index_frienships_on_reciever_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "status", default: "pending"
    t.bigint "challenge_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "invitee_id"
    t.bigint "inviter_id"
    t.index ["challenge_id"], name: "index_invites_on_challenge_id"
    t.index ["invitee_id"], name: "index_invites_on_invitee_id"
    t.index ["inviter_id"], name: "index_invites_on_inviter_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "challenge_infos", "challenges"
  add_foreign_key "challenge_infos", "users"
  add_foreign_key "challenges", "users"
  add_foreign_key "exercise_comments", "exercise_sessions"
  add_foreign_key "exercise_sessions", "challenge_infos"
  add_foreign_key "frienships", "users", column: "asker_id"
  add_foreign_key "frienships", "users", column: "reciever_id"
  add_foreign_key "invites", "challenges"
end
