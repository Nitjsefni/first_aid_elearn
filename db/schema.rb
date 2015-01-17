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

ActiveRecord::Schema.define(version: 20150117103016) do

  create_table "exams", force: true do |t|
    t.string   "title"
    t.text     "text"
    t.string   "level"
    t.text     "question1"
    t.text     "question2"
    t.text     "question3"
    t.text     "question4"
    t.text     "question5"
    t.text     "question6"
    t.text     "question7"
    t.text     "question8"
    t.text     "question9"
    t.text     "question10"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "branch"
    t.text     "text"
    t.text     "answer1"
    t.text     "answer2"
    t.text     "answer3"
    t.text     "answer4"
    t.text     "answerR"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "questionID"
    t.string   "level"
  end

  create_table "user_progresses", force: true do |t|
    t.integer  "user_id"
    t.boolean  "p1"
    t.boolean  "p2"
    t.boolean  "p3"
    t.boolean  "p4"
    t.boolean  "p5"
    t.boolean  "p6"
    t.boolean  "p7"
    t.boolean  "p8"
    t.boolean  "p9"
    t.boolean  "p10"
    t.boolean  "poczatkujacy"
    t.boolean  "z1"
    t.boolean  "z2"
    t.boolean  "z3"
    t.boolean  "z4"
    t.boolean  "z5"
    t.boolean  "z6"
    t.boolean  "z7"
    t.boolean  "z8"
    t.boolean  "z9"
    t.boolean  "z10"
    t.boolean  "zaawansowany"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "admin"
    t.boolean  "instructor"
    t.integer  "points",                 default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
